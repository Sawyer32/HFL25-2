import 'package:v03/v04_helpers.dart' as v02_helpers;
import 'package:v03/v04_manager.dart';
import 'package:v03/v04_menu_options.dart' as v02_menu;
import 'package:v03/v04_models.dart';

void main(List<String> arguments) {
  gameHandler();
}

void gameHandler() async {
  await HeroDataManager().initializeHeroes();
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
      case MenuOptions.newHero:
        currentMenu = await v02_menu.createHero();
      case MenuOptions.list:
        currentMenu = await v02_menu.listHeroesMenu();
        break;
      case MenuOptions.search:
        currentMenu = await v02_menu.searchHeroMenu();
        break;
      case MenuOptions.exit:
        isRunning = false;
        break;
    }
  }
}

