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
  String input = "";
  v02_helpers.clearTerminal();

  while(isRunning) {
    switch(input) {
      case "2":
        input = v02_menu.listHeroesMenu();
      case "3":
        exit(0);
      default:
        input = v02_menu.mainMenu();
        break;
    }
  }
}

