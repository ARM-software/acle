#!/usr/bin/env python3

# SPDX-FileCopyrightText: Copyright 2026 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import subprocess
import sys
import tempfile
import xml.etree.ElementTree as ET
from pathlib import Path
from urllib.parse import urlparse


CONFIG_FILE = Path(".github/workflows/markdown-link-check.json")


def testcase_properties(testcase: ET.Element) -> dict[str, str]:
	properties: dict[str, str] = {}

	properties_element = testcase.find("properties")
	if properties_element is None:
		return properties

	for prop in properties_element.findall("property"):
		name = prop.get("name")
		value = prop.get("value")

		if name is not None and value is not None:
			properties[name] = value

	return properties


def main() -> int:
	if len(sys.argv) != 2:
		print(
			f"Usage: {Path(sys.argv[0]).name} <markdown-file>",
			file=sys.stderr,
		)
		return 2

	markdown_file = Path(sys.argv[1])

	with tempfile.NamedTemporaryFile(
		suffix=".xml",
		delete=False,
	) as report:
		report_path = Path(report.name)

	cmd = [
		"markdown-link-check",
		"--reporters",
		"junit",
		"--junit-output",
		str(report_path),
		"--config",
		str(CONFIG_FILE),
		str(markdown_file),
	]

	proc = subprocess.run(
		cmd,
		text=True,
		capture_output=True,
		check=False,
	)

	if proc.stdout:
		print(proc.stdout, end="")

	if proc.stderr:
		print(proc.stderr, end="", file=sys.stderr)

	try:
		root = ET.parse(report_path).getroot()
	except (ET.ParseError, OSError) as error:
		print(
			f"Could not read markdown-link-check report for "
			f"{markdown_file}: {error}",
			file=sys.stderr,
		)
		return proc.returncode if proc.returncode != 0 else 2
	finally:
		report_path.unlink(missing_ok=True)

	failed = False

	for testcase in root.findall(".//testcase"):
		properties = testcase_properties(testcase)

		url = properties.get("url", testcase.get("name", "unknown"))
		status = properties.get("status", "unknown")
		status_code = properties.get("statusCode")

		parsed_url = urlparse(url)

		is_ignored_developer_arm_403 = (
			parsed_url.hostname == "developer.arm.com"
			and status == "dead"
			and status_code == "403"
		)

		if is_ignored_developer_arm_403:
			print(f"IGNORED (403 from developer.arm.com): {url}")
			continue

		failure = testcase.find("failure")
		error = testcase.find("error")

		if failure is not None or error is not None:
			failed = True
			print(
				f"BROKEN ({status_code or status}): {url}",
				file=sys.stderr,
			)

	return 1 if failed else 0


if __name__ == "__main__":
	sys.exit(main())
