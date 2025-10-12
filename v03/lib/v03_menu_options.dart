import 'dart:io';
import 'package:v03/v03_helpers.dart' as v02_helpers;
import 'package:v03/v03_models.dart';
import 'package:v03/v03_manager.dart' as manager;

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
  final manager.HeroDataManager _manager = manager.HeroDataManager();
  while (true) {
    v02_helpers.clearTerminal();
    print("0. Tillbaka");
    final heroes = await _manager.getHeroList();

    heroes.sort((a, b) {
      final aStrength = num.parse((a['powerstats'] ?? {})['strength'] ?? 0);
      final bStrength = num.parse((b['powerstats'] ?? {})['strength'] ?? 0);
      return bStrength.compareTo(aStrength);
    });

    print("=== Lista över hjältar ===");
    if (heroes.isEmpty) {
      print("Inga hjältar hittades!");
    }
    for (var hero in heroes) {
      final powerstats = (hero['powerstats'] ?? {}) as Map<String, dynamic>;
      final biography = (hero['biography'] ?? {}) as Map<String, dynamic>;
      final appearance = (hero['appearance'] ?? {}) as Map<String, dynamic>;
      final work = (hero['work'] ?? {}) as Map<String, dynamic>;
      final connections = (hero['connections'] ?? {}) as Map<String, dynamic>;
      stdout.writeln(
        "Name: ${hero['name']},\nIntellekt: ${powerstats['intelligence']}\nStyrka: ${powerstats['strength']},\nSnabbhet: ${powerstats['speed']},\nUthållighet: ${powerstats['durability']},\nKraft: ${powerstats['power']},\nStridsförmåga: ${powerstats['combat']},\nFullständigt namn: ${biography['full-name']},\nAlter egos: ${biography['alter-egos']},\nAlias: ${biography['aliases']},\nFödelseort: ${biography['place-of-birth']},\nFörsta framträdande: ${biography['first-appearance']},\nUtgivare: ${biography['publisher']},\nTillhörighet: ${biography['alignment']},\nKön: ${appearance['gender']},\nRas: ${appearance['race']},\nLängd: ${appearance['height']},\nVikt: ${appearance['weight']},\nÖgonfärg: ${appearance['eye-color']},\nHårfärg: ${appearance['hair-color']},\nArbete: ${work['occupation']},\nArbetsplats: ${work['base']},\nGrupp: ${connections['group-affiliation']},\nAnhöriga: ${connections['relatives']},\nBild: ${hero['image']['url']},\n================",
      );
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
  final manager.HeroDataManager _manager = manager.HeroDataManager();
  stdout.write("Id: ");
  String id = stdin.readLineSync() ?? "";
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
  stdout.write("Alter ego (Lämna tomt för default): ");
  String alterEgo = stdin.readLineSync() ?? "Inget alter ego";
  stdout.write("Alias: ");
  String alias = stdin.readLineSync() ?? "";
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

  List<String> alterEgos = [];
  alterEgos.add(alterEgo);
  List<String> aliases = [];
  aliases.add(alias);
  List<String> heights = [];
  if (height.isNotEmpty) {
    final double inches = int.parse(height) / 2.54;
    heights.add(height);
    heights.add(inches.toString());
  }
  List<String> weights = [];
  if (weight.isNotEmpty) {
    final double lbs = int.parse(height) * 2.2;
    weights.add(weight);
    weights.add(lbs.toString());
  }
  
  
  final HeroModel hero = HeroModel(
    response: "success",
    id: "1",
    name: name,
    powerstats: HeroPowerStats(intelligence, strength, speed, durability, power, combat),
    biography: HeroBiography(fullName, alterEgos, aliases, placeOfBirth, firstAppearance, publisher, alignment),
    appearance: HeroAppearance(gender, race, heights, weights, eyeColor, hairColor),
    connections: HeroConnection(groupAffiliation, relatives),
    work: HeroWork(work, base),
    image: HeroImage(image)
  );

  await _manager.saveHero(hero);

  // await v02_helpers.saveHeroToFile(hero);

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
      stdout.writeln(
        "Namn: ${hero['name']}, Level: ${hero['level']}, Styrka: ${attributes['strength']}, Stamina: ${attributes['stamina']}, Ras: ${type['race']}, Faktion: ${type['faction']}",
      );
    }

    stdout.writeln("Tryck Enter för att söka igen...");
    stdin.readLineSync();
    v02_helpers.clearTerminal();
  }
}
