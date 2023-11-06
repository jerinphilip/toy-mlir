#!/bin/bash
#

MLIR_PATH=/home/jerin/code/llvm-project/build-mlir/bin/
MLIR_SRC_ROOT=/home/jerin/code/llvm-project/mlir
MLIR_INCLUDE_DIR=${MLIR_SRC_ROOT}/include/
export PATH="$MLIR_PATH:$PATH"

set -x

TOYC=build/toy/toyc

${TOYC} examples/basic.toy -emit=ast
mlir-tblgen -I${MLIR_INCLUDE_DIR} -gen-dialect-decls toy/Ops.td
mlir-tblgen -I${MLIR_INCLUDE_DIR} -gen-op-defs toy/Ops.td &> /dev/null

${TOYC} examples/codegen.toy -emit=mlir -mlir-print-debuginfo 2> examples/codegen.mlir
${TOYC} examples/codegen.mlir -emit=mlir
${TOYC} examples/trivial_reshape.toy -emit=mlir -opt
${TOYC} examples/codegen.toy -emit=mlir -opt -mlir-print-debuginfo
