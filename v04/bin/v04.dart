import 'package:v04/helpers/v04_helpers.dart' as v04_helpers;
import 'package:v04/managers/v04_manager.dart';
import 'package:v04/v04_menu_options.dart' as v04_menu;
import 'package:v04/models/v04_models.dart';
import 'package:dotenv/dotenv.dart';

void main(List<String> arguments) {
  gameHandler();
}

void gameHandler() async {
  final manager = HeroDataManager();
  await manager.initializeHeroes();
  bool isRunning = true;
  MenuOptions currentMenu = MenuOptions.main;
  v04_helpers.clearTerminal();

  while(isRunning) {
    switch(currentMenu) {
      case MenuOptions.main:
        v04_helpers.clearTerminal();
        currentMenu = v04_menu.mainMenu();
        break;
      case MenuOptions.create:
        currentMenu = v04_menu.createHeroMenu();
        break;
      case MenuOptions.newHero:
        currentMenu = await v04_menu.createHero();
      case MenuOptions.list:
        currentMenu = await v04_menu.listHeroesMenu();
        break;
      case MenuOptions.searchApi:
        currentMenu = await v04_menu.searchHeroApi();
        break;
      case MenuOptions.removeHero:
        currentMenu = await v04_menu.removeHeroMenu();
        break;
      case MenuOptions.exit:
        await manager.saveToJson();
        isRunning = false;
        break;
    }
  }
}

