import os
import re
import shlex
import subprocess
import sys
from argparse import ArgumentParser


def run_single(fpath):
    pattern = re.compile(r"RUN: (.*)")
    with open(fpath) as fp:
        line = fp.readline()
        line = line.strip()
        match = re.search(pattern, line)
        if match is not None:
            command = match.group(1)
            command = command.replace("%s", fpath)
            result = subprocess.run(
                command,
                shell=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            if result.returncode != 0:
                print(result.stdout, file=sys.stdout)
                print(result.stderr, file=sys.stderr)


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("--tests", nargs="+", type=str, required=True)

    args = parser.parse_args()

    for test in args.tests:
        run_single(test)
