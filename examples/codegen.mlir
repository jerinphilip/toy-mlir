module {
  toy.func @multiply_transpose(%arg0: tensor<*xf64> loc("examples/codegen.toy":4:1), %arg1: tensor<*xf64> loc("examples/codegen.toy":4:1)) -> tensor<*xf64> {
    %0 = toy.transpose(%arg0 : tensor<*xf64>) to tensor<*xf64> loc("examples/codegen.toy":5:10)
    %1 = toy.transpose(%arg1 : tensor<*xf64>) to tensor<*xf64> loc("examples/codegen.toy":5:25)
    %2 = toy.mul %0, %1 : tensor<*xf64> loc("examples/codegen.toy":5:25)
    toy.return %2 : tensor<*xf64> loc("examples/codegen.toy":5:3)
  } loc("examples/codegen.toy":4:1)
  toy.func @main() {
    %0 = toy.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64> loc("examples/codegen.toy":9:17)
    %1 = toy.reshape(%0 : tensor<2x3xf64>) to tensor<2x3xf64> loc("examples/codegen.toy":9:3)
    %2 = toy.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00]> : tensor<6xf64> loc("examples/codegen.toy":10:17)
    %3 = toy.reshape(%2 : tensor<6xf64>) to tensor<2x3xf64> loc("examples/codegen.toy":10:3)
    %4 = toy.generic_call @multiply_transpose(%1, %3) : (tensor<2x3xf64>, tensor<2x3xf64>) -> tensor<*xf64> loc("examples/codegen.toy":11:11)
    %5 = toy.generic_call @multiply_transpose(%3, %1) : (tensor<2x3xf64>, tensor<2x3xf64>) -> tensor<*xf64> loc("examples/codegen.toy":12:11)
    toy.print %5 : tensor<*xf64> loc("examples/codegen.toy":13:3)
    toy.return loc("examples/codegen.toy":8:1)
  } loc("examples/codegen.toy":8:1)
} loc(unknown)
