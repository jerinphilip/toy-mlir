# toy-mlir

This is an excerpt of the toy-language tutorial MLIR within LLVM. This
repository (and commits, history) is alternate _view_ of the toy language
tutorial.  I created this to have a smaller consolidated source and to follow
what exactly is happening in source between chapters (by means of a _diff_
view). 

LLVM organizes this as different folders:
[ch1](https://github.com/llvm/llvm-project/tree/main/mlir/examples/toy/ch1),
[ch2](https://github.com/llvm/llvm-project/tree/main/mlir/examples/toy/ch2)... 

The following provides diffs corresponding to what's changing between chapters
as opposed to the folder view, and for me is easier to follow and figure out.

1. Initial setup for standalone builds + Chapter 1 [847d15...716325](https://github.com/jerinphilip/toy-mlir/compare/847d15...716325)
2. [Chapter 2: Emitting Basic MLIR](https://github.com/jerinphilip/toy-mlir/commit/1ea795a8741ea63b901152b4c5d40011aabf9420)
3. [Chapter 3: High-level Language-Specific Analysis and Transformation](https://github.com/jerinphilip/toy-mlir/commit/bbc7bc9b063669728ba26f343c16b6878ca0d35d)
4. [Chapter 4: Enabling Generic Transformation with Interfaces](https://github.com/jerinphilip/toy-mlir/commit/ac792399cc427e48cba4601b4bce83e87c12fff3)
5. [Chapter 5: Partial Lowering to Lower-Level Dialects for Optimization](https://github.com/jerinphilip/toy-mlir/commit/c9cdd55b60c29f1be0a8f52eaaac1fe69c933c18)
6. [Chapter 6: Lowering to LLVM and CodeGeneration](https://github.com/jerinphilip/toy-mlir/commit/58c24b26489784c960c7085946ebc801aa20bb17)
7. [Chapter 7: Adding a Composite Type to Toy](https://github.com/jerinphilip/toy-mlir/commit/a08fe58ada8833baeffa107f6b84efead03a3050)

Please be warned there could be errors, and this can go out-of-date in the
future, the following pin marks an LLVM commit where this worked:

* [llvm-project#555a71b](https://github.com/llvm/llvm-project/commit/555a71be457f351411b89c6a6a66aeecf7ca5291)


### Build instructions

I build standalone locally using:

```bash
# Clone LLVM (for building MLIR)
LLVM_SOURCE_DIR=$HOME/code/llvm-project
git clone https://github.com/llvm/llvm-project $LLVM_SOURCE_DIR

# Move to a known working commit (?)
git -C $LLVM_SOURCE_DIR checkout 555a71b

# Clone this repository, and switch to source-root
git clone https://github.com/jerinphilip/toy-mlir
cd toy-mlir 

# Build MLIR to $LLVM_SOURCE_DIR/build-mlir
bash scripts/build-llvm-mlir.sh

# Build ToyC.
bash scripts/standalone-build.sh
```

The shell-scripts above assume the LLVM source is at `$HOME/code/llvm-project`.
You may look within the scripts and adapt for your use-case accordingly.
