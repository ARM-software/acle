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

import json
import subprocess
import sys
from urllib.parse import urlparse

cmd = [
    "markdown-link-check",
    "-j",
    "--config-file",
    ".github/workflows/markdown-link-check.json",
    *sys.argv[1:]
]

proc = subprocess.run(cmd, capture_output=True, text=True)

# If the checker itself failed unexpectedly, propagate that.
if proc.returncode not in (0, 1):
    print(proc.stdout, end="")
    print(proc.stderr, end="", file=sys.stderr)
    sys.exit(proc.returncode)

results = json.loads(proc.stdout)

failed = False

for result in results:
    url = result["link"]
    status = result["status"]
    status_code = result.get("statusCode")

    host = urlparse(url).netloc

    if (
        host == "developer.arm.com"
        and status == "dead"
        and status_code == 403
    ):
        print(f"IGNORING developer.arm.com 403: {url}")
        continue

    if status == "dead":
        failed = True
        print(f"BROKEN ({status_code}): {url}")

sys.exit(1 if failed else 0)