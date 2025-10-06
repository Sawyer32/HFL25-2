
import 'dart:io';
import 'package:v02/v02_helpers.dart' as v02_helpers;

String mainMenu() {
  print("1. Skapa hjälte");
  print("2. Visa alla hjältar");
  print("3. Avsluta");
  String input = v02_helpers.selectOption();
  return input;
}

String listHeroesMenu() {
  v02_helpers.clearTerminal();
  print("0. Tillbaka");
  String input = v02_helpers.selectOption();
  if (input.isNotEmpty) v02_helpers.clearTerminal();
  return input;
}

String createHeroMenu() {
  v02_helpers.clearTerminal();
  stdout.writeln("0. Tillbaka");
  String input = v02_helpers.selectOption();
  return input;
}