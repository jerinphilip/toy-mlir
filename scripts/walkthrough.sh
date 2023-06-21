#!/bin/bash
#

MLIR_PATH=/home/jerin/code/llvm-project/build/bin/
export PATH="$MLIR_PATH:$PATH"


toyc-ch1 examples/basic.toy -emit=ast
