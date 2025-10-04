import 'dart:convert';
import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:v02/v02.dart' as v02;
import 'package:v02/v02_models.dart' as v02_models;



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
  final settingsMenu = v02_models.Menu('Inställningar', [
    v02_models.Option('Byt språk', action: () => print('Språk ändrat')),
    v02_models.Option('Tillbaka', isExit: true),
  ]);

  final mainMenu = v02_models.Menu('Huvudmeny', [
    v02_models.Option('Lägg till hjälte', action: () async {
      await createHero();
    }),
    v02_models.Option('Visa alla hjältar', action: () async {
      await listHeroes(db);
      // final heroes = await db.query('heroes');
      // print(heroes.map((e) => 'Namn: ${e['name']}, Styrka: ${e['strength']}, Ras: ${e['race']}').join('\n'));
    }),
    v02_models.Option('Inställningar', nextMenu: settingsMenu),
    v02_models.Option('Visa info', action: () => print('Info om programmet')),
    v02_models.Option('Avsluta', isExit: true),
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

  final hero = v02_models.Hero(name, strength, race);
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

