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
${TOYC} examples/affine-lowering.mlir -emit=mlir-affine

echo 'def main() { print([[1, 2], [3, 4]]); }' | ${TOYC} -emit=jit
echo 'def main() { print([[1, 2], [3, 4]]); }' | ${TOYC} -emit=mlir
echo 'def main() { print([[1, 2], [3, 4]]); }' | ${TOYC} -emit=mlir-affine
echo 'def main() { print([[1, 2], [3, 4]]); }' | ${TOYC} -emit=mlir-llvm
echo 'def main() { print([[1, 2], [3, 4]]); }' | ${TOYC} -emit=llvm

echo 'def main() { print([[1, 2], [3, 4]]); }' | ${TOYC} --mlir-print-ir-after-all -emit=jit
echo 'def main() { print([[1, 2], [3, 4]]); }' | ${TOYC} --mlir-print-ir-after-all -emit=mlir
echo 'def main() { print([[1, 2], [3, 4]]); }' | ${TOYC} --mlir-print-ir-after-all -emit=mlir-affine
echo 'def main() { print([[1, 2], [3, 4]]); }' | ${TOYC} --mlir-print-ir-after-all -emit=mlir-llvm
echo 'def main() { print([[1, 2], [3, 4]]); }' | ${TOYC} --mlir-print-ir-after-all -emit=llvm

${TOYC} examples/struct-codegen.toy -emit=mlir
