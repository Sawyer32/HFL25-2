import 'package:v01/v01.dart';
import 'package:test/test.dart';

void main() {
  test('calculate-addition', () {
    expect(calculate("3 + 3"), 6);
  });
  test('calculate-subtraction', () {
    expect(calculate("3 - 2"), 1);
  });
}
