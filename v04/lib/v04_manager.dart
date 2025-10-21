import 'dart:convert';
import 'dart:io';

import 'package:uuid/uuid.dart';
import 'package:v04/v04_models.dart';

abstract class HeroDataManaging {
  Future<void> saveHero(HeroModel hero);
  Future<List<HeroModel>> getHeroList();
  Future<HeroModel?> searchHero(String name);
  Future<void> initializeHeroes();
}

class HeroDataManager implements HeroDataManaging {
  List<HeroModel> heroList = [];
  
  HeroDataManager._();
  static final HeroDataManager _instance = HeroDataManager._();

  factory HeroDataManager() => _instance;

  final _uuid = const Uuid();

  @override
  Future<List<HeroModel>> getHeroList() async {
    return heroList;
  }

  @override
  Future<void> saveHero(HeroModel hero) async {
    hero.id ??= _uuid.v4();
    heroList.add(hero);
    await saveToJson();  
  }

  @override
  Future<HeroModel?> searchHero(String name) async {
    try {
      return heroList.firstWhere((hero) => hero.name.toLowerCase() == name.toLowerCase());
    } catch (e) {
      return null;
    }
  }
  
  @override
  Future<void> initializeHeroes() async {
    final file = File("heroes.json");
    try {
      if (await file.exists()) {
        final content = await file.readAsString();

        if (content.isNotEmpty) {
          final decoded = jsonDecode(content) as List<dynamic>;
          heroList = decoded.map((e) => HeroModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print("Kunde inte läsa in heroes.json: $e");
      heroList = [];
    }
  }

  Future<void> saveToJson() async {
    final file = File("heroes.json");
    final jsonHeroList = heroList.map((h) => h.toJson()).toList();

    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(jsonHeroList),
      encoding: utf8,
    );

    print("Hjälte sparad till heroes.json!");
  }
}
