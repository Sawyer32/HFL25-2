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
  if (b == 0) {
    throw "Kan inte dela med noll..\n";
  }
  return a / b;
}

int modulus(int a, int b) {
  if (b == 0) {
    throw "Kan inte dela med noll..";
  }
  return a % b;
}