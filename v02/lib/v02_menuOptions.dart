
import 'dart:io';
import 'package:v02/v02_helpers.dart' as v02_helpers;

String mainMenu() {
  print("1. Skapa hjälte");
  print("2. Visa alla hjältar");
  print("3. Avsluta");
  stdout.write("Välj alternativ: ");
  String input = stdin.readLineSync() ?? "";
  return input;
}

String listHeroesMenu() {
  v02_helpers.clearTerminal();
  print("0. Tillbaka");
  stdout.write("Välj alternativ: ");
  String input = stdin.readLineSync() ?? "";
  if (input.isNotEmpty) v02_helpers.clearTerminal();
  return input;
}