#!/bin/bash
#

MLIR_PATH=/home/jerin/code/llvm-project/build-mlir/bin/
MLIR_SRC_ROOT=/home/jerin/code/llvm-project/mlir
MLIR_INCLUDE_DIR=${MLIR_SRC_ROOT}/include/
export PATH="$MLIR_PATH:$PATH"

set -x

build/bin/toyc examples/basic.toy -emit=ast
mlir-tblgen -I${MLIR_INCLUDE_DIR} -gen-dialect-decls toy/Ops.td
mlir-tblgen -I${MLIR_INCLUDE_DIR} -gen-op-defs toy/Ops.td
