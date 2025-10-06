
import 'dart:io';
import 'package:v02/v02_helpers.dart' as v02_helpers;
import 'package:v02/v02_models.dart' as v02_models;

v02_models.MenuOptions mainMenu() {
  print("1. Skapa hjälte");
  print("2. Visa alla hjältar");
  print("3. Avsluta");
  final input = v02_helpers.selectOption();

  switch (input) {
    case "1":
      v02_helpers.clearTerminal();
      return v02_models.MenuOptions.create;
    case "2": 
      v02_helpers.clearTerminal();
      return v02_models.MenuOptions.list;
    case "3":
      return v02_models.MenuOptions.exit;
    default: 
      v02_helpers.clearTerminal();
      print("Ogiltigt val");
      return v02_models.MenuOptions.main;
  }
}

v02_models.MenuOptions listHeroesMenu() {
  while (true) {
    v02_helpers.clearTerminal();
    print("0. Tillbaka");
    final String input = v02_helpers.selectOption();

    if (input == "0") return v02_models.MenuOptions.main;

    print("Ogiltigt val");
  }
}

v02_models.MenuOptions createHeroMenu() {
    v02_helpers.clearTerminal();
  while (true) {
    stdout.writeln("0. Tillbaka");

    final String input = v02_helpers.selectOption();
    if (input == "0") return v02_models.MenuOptions.main;
    print("Ogiltigt val");
  }
}