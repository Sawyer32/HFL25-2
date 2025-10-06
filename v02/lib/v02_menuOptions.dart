
import 'dart:io';
import 'package:v02/v02_helpers.dart' as v02_helpers;

String mainMenu() {
  print("1. Skapa hjälte");
  print("2. Visa alla hjältar");
  print("3. Avsluta");
  final input = v02_helpers.selectOption();

  switch (input) {
    case "1":
      v02_helpers.clearTerminal();
      return "create";
    case "2": 
      v02_helpers.clearTerminal();
      return "list";
    case "3":
      return "exit";
    default: 
      v02_helpers.clearTerminal();
      print("Ogiltigt val");
      return "main";
  }
}

String listHeroesMenu() {
  while (true) {
    v02_helpers.clearTerminal();
    print("0. Tillbaka");
    final String input = v02_helpers.selectOption();

    if (input == "0") return "main";

    print("Ogiltigt val");
  }
}

String createHeroMenu() {
    v02_helpers.clearTerminal();
  while (true) {
    stdout.writeln("0. Tillbaka");

    final String input = v02_helpers.selectOption();
    if (input == "0") return "main";

    print("Ogiltigt val");
  }
}