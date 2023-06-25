#!/bin/bash
#

MLIR_PATH=/home/jerin/code/llvm-project/build/bin/
MLIR_SRC_ROOT=/home/jerin/code/llvm-project/mlir
export PATH="$MLIR_PATH:$PATH"

set -x

toyc-ch1 examples/basic.toy -emit=ast

$MLIR_PATH/mlir-tblgen -gen-dialect-decls toy/Ops.td -I ${MLIR_SRC_ROOT}/include/
