num? calculate(String input) {
  List<String> values = parseInput(input);
  
  if (values.isEmpty) {
    return null;
  }

  final String left = values[0];
  final String op = values[1];
  final String right = values[2];
  num? result;

  switch (op) {
    case "+":
      result = addition(int.parse(left), int.parse(right));      
      break;
    case "-":
      result = subtract(int.parse(left), int.parse(right));
      break;
    case "*":
      result = multiply(int.parse(left), int.parse(right));
      break;
    case "/":
      result = divide(double.parse(left), double.parse(right));
      break;
    case "%":
      result = modulus(int.parse(left), int.parse(right));
    default: 
      result = null;
  }
  
  return result;

}

List<String> parseInput(String input) {
  final reg = RegExp(r'\s*(\d+)\s*([^0-9])\s*(\d+)');
  final res = reg.firstMatch(input);
  
  if (res == null) {
    return [];
  }

  final String leftValue = res.group(1)!;
  final String op = res.group(2)!;
  final String rightValue = res.group(3)!;

  return [leftValue, op, rightValue];
}

int addition(int a, int b) {
  return a + b;
}

int subtract(int a, int b) {
  return a - b;
}

int multiply(int a, int b) {
  return a * b;
}

double divide(double a, double b) {
  return a / b;
}

int modulus(int a, int b) {
  return a % b;
}