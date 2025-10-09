import 'dart:io';
import 'package:v03/v03_helpers.dart' as v02_helpers;
import 'package:v03/v03_models.dart';

MenuOptions mainMenu() {
  print("1. Skapa hjälte");
  print("2. Visa alla hjältar");
  print("3. Sök hjältar");
  print("4. Avsluta");
  final input = v02_helpers.selectOption();

  switch (input) {
    case "1":
      v02_helpers.clearTerminal();
      return MenuOptions.create;
    case "2": 
      v02_helpers.clearTerminal();
      return MenuOptions.list;
    case "3":
      v02_helpers.clearTerminal();
      return MenuOptions.search;
    case "4":
      return MenuOptions.exit;
    default: 
      v02_helpers.clearTerminal();
      print("Ogiltigt val");
      return MenuOptions.main;
  }
}

Future<MenuOptions> listHeroesMenu() async {
  while (true) {
    v02_helpers.clearTerminal();
    print("0. Tillbaka");
    final heroes = await v02_helpers.readHeroesFromJson();

    heroes.sort((a, b) {
      final aStrength = ((a['attributes'] ?? {})['strength'] ?? 0) as int;
      final bStrength = ((b['attributes'] ?? {})['strength'] ?? 0) as int;
      return bStrength.compareTo(aStrength);
    });
    
    print("=== Lista över hjältar ===");
    if (heroes.isEmpty) {
      print("Inga hjältar hittades!");
    }
    for (var hero in heroes) {
      final attributes = (hero['attributes'] ?? {}) as Map<String, dynamic>;
      final type = (hero['type'] ?? {}) as Map<String, dynamic>;
      stdout.writeln("Namn: ${hero['name']}, Level: ${hero['level']}, Styrka: ${attributes['strength']}, Stamina: ${attributes['stamina']}, Ras: ${type['race']}, Faktion: ${type['faction']}");
    }
    final String input = v02_helpers.selectOption();
    if (input == "0") return MenuOptions.main;

    print("Ogiltigt val");
  }
}

MenuOptions createHeroMenu() {
  stdout.writeln("1. Ny hjälte");
  stdout.writeln("2. Tillbaka");
  final String input = v02_helpers.selectOption();

  switch (input) {
    case "1":
      v02_helpers.clearTerminal();
      return MenuOptions.newHero;
    case "2": 
      v02_helpers.clearTerminal();
      return MenuOptions.main;
    case "3":
      return MenuOptions.exit;
    default: 
      v02_helpers.clearTerminal();
      print("Ogiltigt val");
      return MenuOptions.create;
  }
}

Future<MenuOptions> createHero() async {
  stdout.write("Namn: ");
  String name = stdin.readLineSync() ?? "";
  stdout.write("Level: ");
  String level = stdin.readLineSync() ?? "";
  stdout.write("Styrka: ");
  String strength = stdin.readLineSync() ?? "";
  stdout.write("Stamina: ");
  String stamina = stdin.readLineSync() ?? "";
  stdout.write("Ras (Människa, Alv, Orc): ");
  String race = stdin.readLineSync() ?? "";
  stdout.write("Faktion (God, ond): ");
  String faction = stdin.readLineSync() ?? "";


  final Hero hero = Hero(
    name: name,
    level: int.parse(level),
    attributes: HeroAttributes(strength: int.parse(strength), stamina: int.parse(stamina)),
    type: HeroType(race, faction)
  );

  await v02_helpers.saveHeroToFile(hero);

  await Future.delayed(Duration(milliseconds: 400));
  return MenuOptions.main;
}

Future<MenuOptions> searchHeroMenu() async {
  v02_helpers.clearTerminal();
  while (true) {
    var heroes = await v02_helpers.readHeroesFromJson();
    stdout.writeln("=== Sök bland hjältarna ===");
    if (heroes.isEmpty) {
      stdout.writeln("Inga hjältar finns.");
    } 
    stdout.write("Sökord: ");
    final String searchParam = stdin.readLineSync() ?? "";
    if (searchParam == "0") {
      return MenuOptions.main;
    }

    final query = searchParam.toLowerCase();

    final matches = heroes.where((hero) {
      final name = (hero['name'] ?? '').toString().toLowerCase();
      return name == query;
    }).toList();
    
    if (matches.isEmpty) {
      stdout.writeln("Ingen hjälte hittades");
    }

    for (var hero in matches) {
      final attributes = (hero['attributes'] ?? {}) as Map<String, dynamic>;
      final type = (hero['type'] ?? {}) as Map<String, dynamic>;
      stdout.writeln("Namn: ${hero['name']}, Level: ${hero['level']}, Styrka: ${attributes['strength']}, Stamina: ${attributes['stamina']}, Ras: ${type['race']}, Faktion: ${type['faction']}");
    }

    stdout.writeln("Tryck Enter för att söka igen...");   
    stdin.readLineSync();
    v02_helpers.clearTerminal();        
  }
}