
import 'dart:io';
import 'package:v02/v02_helpers.dart' as v02_helpers;
import 'package:v02/v02_models.dart';

MenuOptions mainMenu() {
  print("1. Skapa hjälte");
  print("2. Visa alla hjältar");
  print("3. Avsluta");
  final input = v02_helpers.selectOption();

  switch (input) {
    case "1":
      v02_helpers.clearTerminal();
      return MenuOptions.create;
    case "2": 
      v02_helpers.clearTerminal();
      return MenuOptions.list;
    case "3":
      return MenuOptions.exit;
    default: 
      v02_helpers.clearTerminal();
      print("Ogiltigt val");
      return MenuOptions.main;
  }
}

MenuOptions listHeroesMenu() {
  while (true) {
    v02_helpers.clearTerminal();
    print("0. Tillbaka");
    final String input = v02_helpers.selectOption();

    if (input == "0") return MenuOptions.main;

    print("Ogiltigt val");
  }
}

MenuOptions createHeroMenu() {
    v02_helpers.clearTerminal();
  while (true) {
    stdout.writeln("0. Tillbaka");

    final String input = v02_helpers.selectOption();
    if (input == "0") return MenuOptions.main;
    print("Ogiltigt val");
  }
}

MenuOptions searchHeroMenu() {
  v02_helpers.clearTerminal();
  while (true) {
    stdout.writeln("0. Tillbaka");
    final String input = v02_helpers.selectOption();

    if (input == 0) return MenuOptions.main;   
  }
}