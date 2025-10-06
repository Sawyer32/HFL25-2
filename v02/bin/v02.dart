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
  String currentMenu = "main";
  v02_helpers.clearTerminal();

  while(isRunning) {
    switch(currentMenu) {
      case "main":
        v02_helpers.clearTerminal();
        currentMenu = v02_menu.mainMenu();
        break;
      case "create":
        currentMenu = v02_menu.createHeroMenu();
        break;
      case "list":
        currentMenu = v02_menu.listHeroesMenu();
        break;
      case "exit":
        isRunning = false;
        break;
    }
  }
}

