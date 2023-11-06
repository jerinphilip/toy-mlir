#!/bin/bash

ARGS=(
  -DLLVM_ENABLE_PROJECTS=mlir
  -DLLVM_BUILD_EXAMPLES=ON
  -DLLVM_TARGETS_TO_BUILD="Native;NVPTX;AMDGPU"
  -DCMAKE_BUILD_TYPE=Release
  -DLLVM_ENABLE_ASSERTIONS=ON

  -DLLVM_PARALLEL_COMPILE_JOBS=28 -DLLVM_PARALLEL_LINK_JOBS=8
  -DLLVM_ENABLE_LLD=ON

  # CCache can drastically speed up further rebuilds, try adding:
  -DLLVM_CCACHE_BUILD=ON
  -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++

)

LLVM_DIR=$HOME/code/llvm-project/llvm
MLIR_BUILD_DIR=${LLVM_DIR}/../build-mlir/
cmake -G Ninja -S ${LLVM_DIR} -B ${MLIR_BUILD_DIR} "${ARGS[@]}"
cmake --build ${MLIR_BUILD_DIR} --target check-mlir
