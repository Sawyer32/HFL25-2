import 'dart:convert';
import 'dart:io';

import 'package:v01/v01.dart' as v01;

void main(List<String> arguments) {
  print('Jespers miniräknare!');

  var input = stdin.readLineSync(encoding: utf8) ?? "";
  var verifyString = v01.splitString(input);
  if (verifyString.length > 3) {
    print("Miniräknaren klarar bara av enkel uträkning med 2 siffror");
    input = stdin.readLineSync(encoding: utf8) ?? "";
  }
  print('Ditt svar: ${v01.calculate(input)}');
}
