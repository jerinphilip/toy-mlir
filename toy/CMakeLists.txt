set(LLVM_LINK_COMPONENTS Support Support nativecodegen OrcJIT)

# Add Ops tablegen
set(LLVM_TARGET_DEFINITIONS Ops.td)
mlir_tablegen(Ops.h.inc -gen-op-decls)
mlir_tablegen(Ops.cpp.inc -gen-op-defs)
mlir_tablegen(Dialect.h.inc -gen-dialect-decls)
mlir_tablegen(Dialect.cpp.inc -gen-dialect-defs)
add_public_tablegen_target(OpsIncGen)

set(LLVM_TARGET_DEFINITIONS ToyCombine.td)
mlir_tablegen(ToyCombine.inc -gen-rewriters)
add_public_tablegen_target(ToyCombineIncGen)

set(LLVM_TARGET_DEFINITIONS ShapeInferenceInterface.td)
mlir_tablegen(ShapeInferenceOpInterfaces.h.inc -gen-op-interface-decls)
mlir_tablegen(ShapeInferenceOpInterfaces.cpp.inc -gen-op-interface-defs)
add_public_tablegen_target(ShapeInferenceInterfaceIncGen)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR}/include/)

add_executable(
  toyc
  toyc.cpp
  AST.cpp
  Dialect.cpp
  MLIRGen.cpp
  ToyCombine.cpp
  ShapeInferencePass.cpp
  LowerToAffineLoops.cpp
  LowerToLLVM.cpp)

add_dependencies(toyc OpsIncGen)
add_dependencies(toyc ToyCombineIncGen)
add_dependencies(toyc ShapeInferenceInterfaceIncGen)

llvm_update_compile_flags(toyc)

get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
get_property(extension_libs GLOBAL PROPERTY MLIR_EXTENSION_LIBS)

target_link_libraries(
  toyc
  PRIVATE ${dialect_libs}
          ${conversion_libs}
          ${extension_libs}
          MLIRAnalysis
          MLIRBuiltinToLLVMIRTranslation
          MLIRIR
          MLIRExecutionEngine
          MLIRParser
          MLIRPass
          MLIRLLVMCommonConversion
          MLIRLLVMDialect
          MLIRLLVMToLLVMIRTranslation
          MLIRTargetLLVMIRExport
          MLIRMemRefDialect
          MLIRFunctionInterfaces
          MLIRSideEffectInterfaces
          MLIRTransforms
          MLIRCastInterfaces)

mlir_check_link_libraries(toyc)
