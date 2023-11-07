from argparse import ArgumentParser
import re
import subprocess as sp


def run_single(fpath):
    pattern = re.compile(r"RUN: (.*)")
    with open(fpath) as fp:
        line = fp.readline()
        line = line.strip()
        match = re.search(pattern, line)
        if match is not None:
            command = match.group(1)
            command = command.replace("%s", fpath)
            sp.run(command, shell=True)


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("--tests", nargs="+")

    args = parser.parse_args()

    for test in args.tests:
        run_single(test)
