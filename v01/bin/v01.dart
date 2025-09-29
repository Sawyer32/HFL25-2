import 'dart:io';

import 'package:v01/v01.dart' as v01;

void main(List<String> arguments) {
  print('Jespers miniräknare!');
  print('För att avsluta skriv q eller quit \n');
  bool isRunning = true;
  while(isRunning) {
    print('Ange ett matematiskt uttryck');
    String input = stdin.readLineSync() ?? "";
    if (input == "q" || input == "quit") {
      isRunning = false;
    } else {
      num? result = v01.calculate(input);
      if (result == null) {
        print("Uträkningen misslyckades. Känner inte igen uttrycket $input");
      } else {
        print('Resultat: $result \n');
      }
    }
  }
}
