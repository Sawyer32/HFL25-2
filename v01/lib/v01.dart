import 'package:v01/v01_math_functions.dart' as v01_math;
import 'package:v01/v01_utility.dart' as v01_utility;

num? calculate(String input) {
  List<String> values = v01_utility.parseInput(input);
  
  if (values.isEmpty) {
    return null;
  }

  final String left = values[0];
  final String op = values[1];
  final String right = values[2];
  num? result;

  switch (op) {
    case "+":
      result = v01_math.addition(int.parse(left), int.parse(right));      
      break;
    case "-":
      result = v01_math.subtract(int.parse(left), int.parse(right));
      break;
    case "*":
      result = v01_math.multiply(int.parse(left), int.parse(right));
      break;
    case "/":
      result = v01_math.divide(double.parse(left), double.parse(right));
      break;
    case "%":
      result = v01_math.modulus(int.parse(left), int.parse(right));
    default: 
      result = null;
  }
  
  return result;
}