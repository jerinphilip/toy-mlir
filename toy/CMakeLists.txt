get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(translation_libs GLOBAL PROPERTY MLIR_TRANSLATION_LIBS)

add_llvm_executable(toyc toyc.cpp AST.cpp)
llvm_update_compile_flags(toyc)
target_link_libraries(
  toyc
  PRIVATE ${dialect_libs}
          ${translation_libs}
          MLIRIR
          MLIRParser
          MLIRPass
          MLIRSPIRVDialect
          MLIRTranslateLib
          MLIRSupport)

mlir_check_link_libraries(toyc)
