#!/bin/bash

MLIR_DIR=/home/jerin/code/llvm-project/build/lib/cmake/mlir
LLVM_EXTERNAL_LIT=/home/jerin/code/llvm-project/build/bin/llvm-lit

cmake -G Ninja -B build -S ./ \
  -DMLIR_DIR=$MLIR_DIR -DLLVM_EXTERNAL_LIT=$LLVM_EXTERNAL_LIT \
  -DLLVM_USE_SANITIZER="Address;Undefined" \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

cmake --build . --target toyc
