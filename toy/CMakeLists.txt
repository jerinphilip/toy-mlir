get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(translation_libs GLOBAL PROPERTY MLIR_TRANSLATION_LIBS)

set(LLVM_TARGET_DEFINITIONS Ops.td)
mlir_tablegen(Ops.h.inc -gen-op-decls)
mlir_tablegen(Ops.cpp.inc -gen-op-defs)
mlir_tablegen(Dialect.h.inc -gen-dialect-decls)
mlir_tablegen(Dialect.cpp.inc -gen-dialect-defs)
add_public_tablegen_target(ToyCh2OpsIncGen)

add_llvm_executable(
  toyc
  toyc.cpp
  AST.cpp
  AST.cpp
  MLIRGen.cpp
  Dialect.cpp
  DEPENDS
  ToyCh2OpsIncGen)

llvm_update_compile_flags(toyc)

target_link_libraries(
  toyc
  PRIVATE ${dialect_libs}
          ${translation_libs}
          MLIRAnalysis
          MLIRIR
          MLIRParser
          MLIRPass
          MLIRSPIRVDialect
          MLIRTranslateLib
          MLIRSupport
          MLIRSideEffectInterfaces
          MLIRTransforms)

mlir_check_link_libraries(toyc)
