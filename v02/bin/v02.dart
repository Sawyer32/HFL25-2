import 'dart:convert';
import 'dart:io';

import 'package:v02/v02.dart' as v02;
import 'package:v02/v02_helpers.dart' as v02_helpers;
import 'package:v02/v02_menuOptions.dart' as v02_menu;
import 'package:v02/v02_models.dart';

void main(List<String> arguments) {
  gameHandler();
}

void gameHandler() {
  bool isRunning = true;
  MenuOptions currentMenu = MenuOptions.main;
  v02_helpers.clearTerminal();

  while(isRunning) {
    switch(currentMenu) {
      case MenuOptions.main:
        v02_helpers.clearTerminal();
        currentMenu = v02_menu.mainMenu();
        break;
      case MenuOptions.create:
        currentMenu = v02_menu.createHeroMenu();
        break;
      case MenuOptions.list:
        currentMenu = v02_menu.listHeroesMenu();
        break;
      case MenuOptions.search:
        currentMenu = v02_menu.searchHeroMenu();
        break;
      case MenuOptions.exit:
        isRunning = false;
        break;
    }
  }
}

