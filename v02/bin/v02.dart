import 'dart:convert';
import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:v02/v02.dart' as v02;
import 'package:v02/v02_models.dart';

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

Future<void> main() async {
  sqfliteFfiInit();
  var factory = databaseFactoryFfi;
  var db = await factory.openDatabase('v02.db');
  await db.execute('''
    CREATE TABLE IF NOT EXISTS heroes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      strength INTEGER,
      race TEXT
    )
  ''');
  bool existing = await db.query('heroes', where: 'name = ?', whereArgs: ["TestHero"]).then((value) => value.isNotEmpty);
  if (!existing) {
    await db.insert('heroes', {'name': 'TestHero', 'strength': 5, 'race': 'Människa'});
  }
  bool isRunning = true;
  final settingsMenu = Menu('Inställningar', [
    Option('Byt språk', action: () => print('Språk ändrat')),
    Option('Tillbaka', isExit: true),
  ]);

  final mainMenu = Menu('Huvudmeny', [
    Option('Lägg till hjälte', action: () async {
      await createHero();
    }),
    Option('Visa alla hjältar', action: () async {
      await listHeroes(db);
      // final heroes = await db.query('heroes');
      // print(heroes.map((e) => 'Namn: ${e['name']}, Styrka: ${e['strength']}, Ras: ${e['race']}').join('\n'));
    }),
    Option('Inställningar', nextMenu: settingsMenu),
    Option('Visa info', action: () => print('Info om programmet')),
    Option('Avsluta', isExit: true),
  ]);

  

  while (isRunning) {
    clearTerminal();
    mainMenu.display();
    if (mainMenu.options.any((opt) => opt.isExit)) {
      isRunning = false;
      db.close();
    }
  }
}


Future<void> createHero() async {
  stdout.write('Ange hjälten namn: ');
  final name = stdin.readLineSync() ?? 'Hjälte';

  stdout.write('Ange hjälten styrka (1-10): ');
  final strengthInput = stdin.readLineSync();
  final strength = int.tryParse(strengthInput ?? '') ?? 5;

  stdout.write('Ange hjälten ras (Människa, Alv, Dvärg): ');
  final race = stdin.readLineSync() ?? 'Människa';

  final hero = Hero(name, strength, race);
  sqfliteFfiInit();
  var factory = databaseFactoryFfi;
  var db = await factory.openDatabase('v02.db');
  bool existing = await db.query('heroes', where: 'name = ?', whereArgs: [hero.name]).then((value) => value.isNotEmpty);
  if (!existing) {
    await db.insert('heroes', {'name': hero.name, 'strength': hero.strength, 'race': hero.race});
  } else {
    print('Hjälte med detta namn finns redan.');
    return;
  }
}

Future<void> listHeroes(Database db) async {
  var heroes = await db.query('heroes');
  print('Alla hjältar:');
  for (var hero in heroes) {
    print('Namn: ${hero['name']}, Styrka: ${hero['strength']}, Ras: ${hero['race']}');
  }
  stdout.write('\nTryck Enter för att återgå till menyn...');
  stdin.readLineSync();
}

void clearTerminal() {
  if (Platform.isWindows) {
    stdout.write('\x1B[2J\x1B[0;0H');
  } else {
    Process.runSync("clear", [], runInShell: true);
  }
}

