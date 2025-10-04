import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Menu {
  final String title;
  final List<Option> options;

  Menu(this.title, this.options);

  Future<void> display() async {
    while (true) {
      print('\n$title');
      for (var i = 0; i < options.length; i++) {
        print('${i + 1}. ${options[i].title}');
      }
      stdout.write('Välj ett alternativ: ');
      final input = stdin.readLineSync();
      final choice = int.tryParse(input ?? '');
      if (choice != null && choice > 0 && choice <= options.length) {
        options[choice - 1].select();
        if (options[choice - 1].isExit) break;
      } else {
        print('Ogiltigt val, försök igen.');
      }
    }
  }
}

class Option {
  final String title;
  final Function? action;
  final Menu? nextMenu;
  final bool isExit;

  Option(this.title, {this.action, this.nextMenu, this.isExit = false});

  Future<void> select() async {
    if (action != null) {
      await action!();
    }
    if (nextMenu != null) {
      await nextMenu!.display();
    }
  }
}

class HeroListMenu {
  final String title;
  final List<Hero> heroes;
  final List<Option> options;

  HeroListMenu(this.title, this.heroes, this.options);

  void display() {
    print('\n$title');
    for (var hero in heroes) {
      print('Namn: ${hero.name}, Styrka: ${hero.strength}, Ras: ${hero.race}');
    }
  }

  static Future<HeroListMenu> fromDatabase(Database db) async {
    final List<Map<String, Object?>> maps = await db.query('heroes');
    final heroes = maps.map((m) => Hero(m['name'] as String, m['strength'] as int, m['race'] as String)).toList();
    final options = [
      Option('Tillbaka', isExit: true),
    ];
    return HeroListMenu('Lista över hjältar', heroes, options);
  }
}

class Hero {
  final String name;
  final int strength;
  final String race;

  Hero(this.name, this.strength, this.race);

  static Future<String> saveHeroToDatabase(Hero hero, Database db) async {
    await db.insert('heroes', <String, Object?>{
      'name': hero.name,
      'strength': hero.strength,
      'race': hero.race,
    });
    return hero.name;
  }
}