#/bin/bash

LLVM_SOURCE=/home/jerin/code/llvm-project/

mkdir -p toy

# Import chapter 1.
rsync -rvz $LLVM_SOURCE/mlir/examples/toy/Ch1/include/toy/ toy/
rsync -rvz $LLVM_SOURCE/mlir/examples/toy/Ch1/parser/ toy/
rsync -rvz $LLVM_SOURCE/mlir/examples/toy/Ch1/toyc.cpp toy/

# Import Chapter 2
rsync -rvz $LLVM_SOURCE/mlir/examples/toy/Ch2/include/toy/Ops.td toy/
rsync -rvz $LLVM_SOURCE/mlir/examples/toy/Ch2/include/toy/ toy/
rsync -rvz $LLVM_SOURCE/mlir/examples/toy/Ch2/parser/ toy/
rsync -rvz $LLVM_SOURCE/mlir/examples/toy/Ch2/mlir/ toy/
rsync -rvz $LLVM_SOURCE/mlir/examples/toy/Ch2/toyc.cpp toy/





