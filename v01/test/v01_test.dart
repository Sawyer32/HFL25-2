import 'package:v01/v01.dart';
import 'package:test/test.dart';

void main() {
  test('calculate-addition', () {
    expect(calculate("1 + 1"), 2);
  });
  test('calculate-subtraction', () {
    expect(calculate("3-2"), 1);
  });
  test('calculate-multiply', () {
    expect(calculate('3*3'), 9);
  });
  test('calculate-divide', () {
    expect(calculate('6/2'), 3);
  });
}
