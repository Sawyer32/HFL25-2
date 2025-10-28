import 'dart:io';
import 'package:v04/v04_helpers.dart' as v04_helpers;
import 'package:v04/v04_models.dart';
import 'package:v04/managers/v04_manager.dart' as manager;

MenuOptions mainMenu() {
  print("1. Skapa hjälte");
  print("2. Visa alla hjältar");
  print("3. Sök hjälte via api");
  print("4. Ta bort hjälte");
  print("5. Avsluta");
  final input = v04_helpers.selectOption();

  switch (input) {
    case "1":
      v04_helpers.clearTerminal();
      return MenuOptions.create;
    case "2":
      v04_helpers.clearTerminal();
      return MenuOptions.list;
    case "3":
      v04_helpers.clearTerminal();
      return MenuOptions.searchApi;
    case "4":
      return MenuOptions.removeHero;
    case "5":
      return MenuOptions.exit;
    default:
      v04_helpers.clearTerminal();
      print("Ogiltigt val");
      return MenuOptions.main;
  }
}

Future<MenuOptions> listHeroesMenu() async {
  final manager.HeroDataManager _manager = manager.HeroDataManager();
  while (true) {
    v04_helpers.clearTerminal();
    print("0. Tillbaka");
    final heroes = await _manager.getHeroList();

    heroes.sort((a, b) {
      final aStrength = a.powerstats?.strength;
      final bStrength = b.powerstats?.strength;
      return bStrength!.compareTo(aStrength!);
    });

    print("=== Lista över hjältar ===");
    if (heroes.isEmpty) {
      print("Inga hjältar hittades!");
    }
    stdout.writeln("=== Goda hjältar ===");
    var goodHeroes = await _manager.goodHeroes();
    for (var good in goodHeroes) {
      stdout.writeln(
        "Name: ${good.name}\n"
        "Intellekt: ${good.powerstats?.intelligence}\n"
        "Styrka: ${good.powerstats?.strength}\n"
        "Snabbhet: ${good.powerstats?.speed}\n"
        "Uthållighet: ${good.powerstats?.durability}\n"
        "Kraft: ${good.powerstats?.power}\n"
        "Stridsförmåga: ${good.powerstats?.combat}\n"
        "Fullständigt namn: ${good.biography?.fullName}\n"
        "Alter egos: ${good.biography?.alterEgo}\n"
        "Alias: ${good.biography?.alias}\n"
        "Födelseort: ${good.biography?.placeOfBirth}\n"
        "Första framträdande: ${good.biography?.firstAppearance}\n"
        "Utgivare: ${good.biography?.publisher}\n"
        "Tillhörighet: ${good.biography?.alignment}\n"
        "Kön: ${good.appearance?.gender}\n"
        "Ras: ${good.appearance?.race}\n"
        "Längd: ${good.appearance?.height}\n"
        "Vikt: ${good.appearance?.weight}\n"
        "Ögonfärg: ${good.appearance?.eyeColor}\n"
        "Hårfärg: ${good.appearance?.hairColor}\n"
        "Arbete: ${good.work?.occupation}\n"
        "Arbetsplats: ${good.work?.base}\n"
        "Grupp: ${good.connections?.groupAffiliation}\n"
        "Anhöriga: ${good.connections?.relative}\n"
        "Bild: ${good.image?.url}\n"
        "================"
      );
    }
    stdout.writeln("=== Onda hjältar ===");
    var evilHeroes = await _manager.badHeroes();
    for (var evil in evilHeroes) {
      stdout.writeln(
        "Name: ${evil.name}\n"
        "Intellekt: ${evil.powerstats?.intelligence}\n"
        "Styrka: ${evil.powerstats?.strength}\n"
        "Snabbhet: ${evil.powerstats?.speed}\n"
        "Uthållighet: ${evil.powerstats?.durability}\n"
        "Kraft: ${evil.powerstats?.power}\n"
        "Stridsförmåga: ${evil.powerstats?.combat}\n"
        "Fullständigt namn: ${evil.biography?.fullName}\n"
        "Alter egos: ${evil.biography?.alterEgo}\n"
        "Alias: ${evil.biography?.alias}\n"
        "Födelseort: ${evil.biography?.placeOfBirth}\n"
        "Första framträdande: ${evil.biography?.firstAppearance}\n"
        "Utgivare: ${evil.biography?.publisher}\n"
        "Tillhörighet: ${evil.biography?.alignment}\n"
        "Kön: ${evil.appearance?.gender}\n"
        "Ras: ${evil.appearance?.race}\n"
        "Längd: ${evil.appearance?.height}\n"
        "Vikt: ${evil.appearance?.weight}\n"
        "Ögonfärg: ${evil.appearance?.eyeColor}\n"
        "Hårfärg: ${evil.appearance?.hairColor}\n"
        "Arbete: ${evil.work?.occupation}\n"
        "Arbetsplats: ${evil.work?.base}\n"
        "Grupp: ${evil.connections?.groupAffiliation}\n"
        "Anhöriga: ${evil.connections?.relative}\n"
        "Bild: ${evil.image?.url}\n"
        "================"
      );
    }
    stdout.writeln("Ange '0' för att gå tillbaka.");
    final String input = v04_helpers.selectOption();
    if (input == "0") return MenuOptions.main;

    print("Ogiltigt val");
  }
}

MenuOptions createHeroMenu() {
  stdout.writeln("1. Ny hjälte");
  stdout.writeln("2. Tillbaka");
  final String input = v04_helpers.selectOption();

  switch (input) {
    case "1":
      v04_helpers.clearTerminal();
      return MenuOptions.newHero;
    case "2":
      v04_helpers.clearTerminal();
      return MenuOptions.main;
    case "3":
      return MenuOptions.exit;
    default:
      v04_helpers.clearTerminal();
      print("Ogiltigt val");
      return MenuOptions.create;
  }
}

Future<MenuOptions> createHero() async {
  final manager.HeroDataManager _manager = manager.HeroDataManager();
  stdout.write("Namn: ");
  String name = stdin.readLineSync() ?? "";
  stdout.write("Intellekt: ");
  String intelligence = stdin.readLineSync() ?? "";
  stdout.write("Styrka: ");
  String strength = stdin.readLineSync() ?? "";
  stdout.write("Snabbhet: ");
  String speed = stdin.readLineSync() ?? "";
  stdout.write("Uthållighet: ");
  String durability = stdin.readLineSync() ?? "";
  stdout.write("Kraft: ");
  String power = stdin.readLineSync() ?? "";
  stdout.write("Stridsförmåga: ");
  String combat = stdin.readLineSync() ?? "";
  stdout.write("Fullständigt namn: ");
  String fullName = stdin.readLineSync() ?? "";
  stdout.write("Alter ego (Separera med kommatecken): ");
  String alterEgo = stdin.readLineSync() ?? "";
  List<String> alterEgos = alterEgo.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
  stdout.write("Alias: ");
  String alias = stdin.readLineSync() ?? "";
  List<String> aliases = alias.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
  stdout.write("Födelseort: ");
  String placeOfBirth = stdin.readLineSync() ?? "";
  stdout.write("Första framträdande: ");
  String firstAppearance = stdin.readLineSync() ?? "";
  stdout.write("Utgivare: ");
  String publisher = stdin.readLineSync() ?? "";
  stdout.write("Tillhörighet (God, Neutral, Ond): ");
  String alignment = stdin.readLineSync() ?? "";
  stdout.write("Kön: ");
  String gender = stdin.readLineSync() ?? "";
  stdout.write("Ras: ");
  String race = stdin.readLineSync() ?? "";
  stdout.write("Längd: ");
  String height = stdin.readLineSync() ?? "";
  stdout.write("Vikt: ");
  String weight = stdin.readLineSync() ?? "";
  stdout.write("Ögonfärg: ");
  String eyeColor = stdin.readLineSync() ?? "";
  stdout.write("Hårfärg: ");
  String hairColor = stdin.readLineSync() ?? "";
  stdout.write("Arbete: ");
  String work = stdin.readLineSync() ?? "";
  stdout.write("Arbetsplats: ");
  String base = stdin.readLineSync() ?? "";
  stdout.write("Grupp: ");
  String groupAffiliation = stdin.readLineSync() ?? "";
  stdout.write("Anhöriga: ");
  String relatives = stdin.readLineSync() ?? "";
  stdout.write("Bild: ");
  String image = stdin.readLineSync() ?? "";

  List<String> heights = [];
  if (height.isNotEmpty) {
    final double inches = int.parse(height) / 2.54;
    heights = [
      '$height cm',
      '${inches.toStringAsFixed(1)} in'
    ];
  }
  List<String> weights = [];
  if (weight.isNotEmpty) {
    final double lbs = int.parse(weight) * 2.2;
    weights = [
      '$weight kg',
      '${lbs.toStringAsFixed(1)} lb'
    ];
  }
  
  
  final HeroModel hero = HeroModel(
    response: "success",
    id: null,
    name: name,
    powerstats: HeroPowerStats(intelligence, strength, speed, durability, power, combat),
    biography: HeroBiography(fullName, alterEgos, aliases, placeOfBirth, firstAppearance, publisher, alignment),
    appearance: HeroAppearance(
      gender: gender,
      race: race,
      height: heights,
      weight: weights,
      eyeColor: eyeColor,
      hairColor: hairColor,
    ),
    connections: HeroConnection(groupAffiliation, relatives),
    work: HeroWork(work, base),
    image: HeroImage(image)
  );

  await _manager.saveHero(hero);

  await Future.delayed(Duration(milliseconds: 400));
  return MenuOptions.main;
}

Future<MenuOptions> searchHeroApi() async {
  final _manager = manager.HeroDataManager();
  v04_helpers.clearTerminal();
  while (true) {
    stdout.writeln("=== Sök bland hjältarna ===");
    stdout.writeln("Ange '0' för att gå tillbaka.");
    stdout.write("Sökord: ");
    final String searchParam = stdin.readLineSync() ?? "";
    if (searchParam == "0") {
      return MenuOptions.main;
    }

    final hero = await _manager.searchHero(searchParam);
    if (hero != null) {
      stdout.writeln(
        "Name: ${hero.name}\n"
        "Intellekt: ${hero.powerstats?.intelligence}\n"
        "Styrka: ${hero.powerstats?.strength}\n"
        "Snabbhet: ${hero.powerstats?.speed}\n"
        "Uthållighet: ${hero.powerstats?.durability}\n"
        "Kraft: ${hero.powerstats?.power}\n"
        "Stridsförmåga: ${hero.powerstats?.combat}\n"
        "Fullständigt namn: ${hero.biography?.fullName}\n"
        "Alter egos: ${hero.biography?.alterEgo}\n"
        "Alias: ${hero.biography?.alias}\n"
        "Födelseort: ${hero.biography?.placeOfBirth}\n"
        "Första framträdande: ${hero.biography?.firstAppearance}\n"
        "Utgivare: ${hero.biography?.publisher}\n"
        "Tillhörighet: ${hero.biography?.alignment}\n"
        "Kön: ${hero.appearance?.gender}\n"
        "Ras: ${hero.appearance?.race}\n"
        "Längd: ${hero.appearance?.height}\n"
        "Vikt: ${hero.appearance?.weight}\n"
        "Ögonfärg: ${hero.appearance?.eyeColor}\n"
        "Hårfärg: ${hero.appearance?.hairColor}\n"
        "Arbete: ${hero.work?.occupation}\n"
        "Arbetsplats: ${hero.work?.base}\n"
        "Grupp: ${hero.connections?.groupAffiliation}\n"
        "Anhöriga: ${hero.connections?.relative}\n"
        "Bild: ${hero.image?.url}\n"
      );
    }

    stdout.writeln("Tryck Enter för att söka igen...");
    stdin.readLineSync();
    v04_helpers.clearTerminal();
  }
}

Future<MenuOptions> removeHeroMenu() async {
  final _manager = manager.HeroDataManager();
  v04_helpers.clearTerminal();
  while (true) {
    stdout.writeln("=== Ta bort hjälte ===");
    stdout.writeln("Ange '0' för att gå tillbaka.");
    stdout.write("Ange namnet på hjälten att ta bort: ");
    final String nameToRemove = stdin.readLineSync() ?? "";
    if (nameToRemove == "0") {
      return MenuOptions.main;
    }

    final bool removed = await _manager.removeHeroByName(nameToRemove);
    if (removed) {
      stdout.writeln("Hjälten '$nameToRemove' har tagits bort.");
    } else {
      stdout.writeln("Ingen hjälte med namnet '$nameToRemove' hittades.");
    }

    stdout.writeln("Tryck Enter för att fortsätta...");
    stdin.readLineSync();
    v04_helpers.clearTerminal();
  }
} 
