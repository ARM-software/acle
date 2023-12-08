"""
"
" Copyright (C) 2023 Arm Ltd
"
"""

from pathlib import Path
import re
import subprocess
import sys


def get_modified_file_list(repo_path: Path) -> list[str]:
    """Use git to get the list of modified files in the patch set"""
    starting_point = "origin/main"
    cmd = ["git", "-C", str(repo_path), "diff", "--name-only", starting_point, "HEAD"]

    try:
        git_result = subprocess.run(args=cmd, capture_output=True, check=True)
    except subprocess.CalledProcessError as ex:
        print(
            f"Error: in command '{' '.join(cmd)}':\n{ex.stderr.decode()}",
            file=sys.stderr,
        )
        sys.exit(1)

    modified_files = git_result.stdout.decode().split("\n")
    modified_files = [x for x in modified_files if x]
    return modified_files


def check_file(file_path: Path) -> bool:
    """Check if file has a draftversion field, and if so, that it's set to true"""
    with file_path.open() as file:
        print(f"Checking file {file_path}")
        for line in file:
            re_result = re.search(r"draftversion: (\w+)", line)
            if not re_result:
                continue

            value = re_result[1]
            if value != "true":
                print(
                    f"Error: file {file_path} has been modified but its draftversion"
                    " isn't set to true!",
                    file=sys.stderr,
                )
                return False

    return True


def main() -> int:
    """Check if any modified file has the wrong value for draftversion"""
    if len(sys.argv) != 2:
        print(
            "Error: this script takes a single positional argument, which is the path"
            " to the ACLE repository!",
            file=sys.stderr,
        )
        sys.exit(1)

    try:
        repo_path = Path(sys.argv[1]).resolve(strict=True)
    except FileNotFoundError:
        print(f"Error: repository {sys.argv[1]} doesn't exist!", file=sys.stderr)
        sys.exit(1)

    modified_files = get_modified_file_list(repo_path)
    print("Files to check:")
    if not modified_files:
        print(" none")
    else:
        for path in modified_files:
            print(f"  - {path}")
    print()

    success = True
    for path in modified_files:
        complete_path = repo_path / Path(path)
        success = check_file(complete_path) and success

    print("\nEnd result: " + ("OK" if success else "issues found"))

    return not success


if __name__ == "__main__":
    sys.exit(main())
