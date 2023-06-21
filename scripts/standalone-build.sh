#!/bin/bash

MLIR_DIR=/home/jerin/code/llvm-project/build/lib/cmake/mlir
LLVM_EXTERNAL_LIT=/home/jerin/code/llvm-project/build/bin/llvm-lit

cmake -G Ninja .. -DMLIR_DIR=$MLIR_DIR -DLLVM_EXTERNAL_LIT=$LLVM_EXTERNAL_LIT
cmake --build . --target toyc

