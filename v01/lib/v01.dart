num calculate(String input) {
  List<String> values = splitString(input);
  final String left = values[0];
  final String exp = values[1];
  final String right = values[2];

  Map<String, num> expressions = ({
    '+': addition(num.parse(left), num.parse(right)),
    '-': subtract(num.parse(left), num.parse(right)),
    '*': multiply(num.parse(left), num.parse(right)),
    '/': divide(num.parse(left), num.parse(right))
  });

  final result = expressions[exp];
  if (result != null) {
    return result;
  } else {
    print("Jag känner inte igen uttrycket");
    return 0;
  }
}

List<String> splitString(String value) {
  return value.split(' ');
}

num addition(num a, num b) {
  return a + b;
}

num subtract(num a, num b) {
  return a - b;
}

num multiply(num a, num b) {
  return a * b;
}

num divide(num a, num b) {
  return a / b;
}