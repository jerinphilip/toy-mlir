#!/bin/bash

LLVM_BUILD_DIR=$HOME/code/llvm-project/build-mlir

MLIR_DIR=${LLVM_BUILD_DIR}/lib/cmake/mlir
LLVM_EXTERNAL_LIT=${LLVM_BUILD_DIR}/bin/llvm-lit

cmake -G Ninja -B build -S . -DMLIR_DIR=$MLIR_DIR -DLLVM_EXTERNAL_LIT=$LLVM_EXTERNAL_LIT
cmake --build build --target toyc
