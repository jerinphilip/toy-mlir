set(LLVM_LINK_COMPONENTS Support)

# Add Ops tablegen
set(LLVM_TARGET_DEFINITIONS Ops.td)
mlir_tablegen(Ops.h.inc -gen-op-decls)
mlir_tablegen(Ops.cpp.inc -gen-op-defs)
mlir_tablegen(Dialect.h.inc -gen-dialect-decls)
mlir_tablegen(Dialect.cpp.inc -gen-dialect-defs)
add_public_tablegen_target(OpsIncGen)

add_executable(toyc toyc.cpp AST.cpp Dialect.cpp MLIRGen.cpp)
add_dependencies(toyc OpsIncGen)

llvm_update_compile_flags(toyc)
target_link_libraries(
  toyc
  PRIVATE MLIRAnalysis
          MLIRIR
          MLIRParser
          MLIRPass
          MLIRFunctionInterfaces
          MLIRSideEffectInterfaces
          MLIRTransforms)

mlir_check_link_libraries(toyc)
