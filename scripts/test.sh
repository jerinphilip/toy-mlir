#/bin/bash

export PATH="$(realpath build/bin):$PATH"

set -x

toyc -emit=mlir -mlir-print-debuginfo examples/basic.toy
toyc -emit=mlir -mlir-print-debuginfo examples/transpose-transpose.toy
