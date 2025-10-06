import 'dart:convert';
import 'dart:io';

import 'package:v02/v02.dart' as v02;
import 'package:v02/v02_helpers.dart' as v02_helpers;
import 'package:v02/v02_menuOptions.dart' as v02_menu;

void main(List<String> arguments) {
  gameHandler();
}

void gameHandler() {
  bool isRunning = true;
  String input = "0";
  v02_helpers.clearTerminal();

  while(isRunning) {
    switch(input) {
      case "0":
        input = v02_menu.mainMenu();
        break;
      case "2":
        input = v02_menu.listHeroesMenu();
        break;
      case "3":
        exit(0);
      default:
        print("Ogiltigt val");
        stdout.write("Välj alternativ: ");
        input = stdin.readLineSync() ?? "";
    }
  }
}

