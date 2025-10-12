import 'dart:convert';
import 'dart:io';

import 'package:v03/v03_models.dart';

abstract class HeroDataManaging {
  List<Map<String, dynamic>> heroes = [];
  int idIncrement = 0;
  Future<void> saveHero(HeroModel hero);
  Future<void> getHeroList();
  Future<HeroModel> searchHero();
}

class HeroDataManager implements HeroDataManaging {
  @override
  List<Map<String, dynamic>> heroes;
  @override
  int idIncrement;

  HeroDataManager._() : heroes = [], idIncrement = 0;
  static final HeroDataManager _instance = HeroDataManager._();

  factory HeroDataManager() => _instance;

  @override
  Future<void> getHeroList() {
    // TODO: implement getHeroList
    throw UnimplementedError();
  }

  @override
  Future<void> saveHero(HeroModel hero) async {
    final file = File("heroes.json");

    if (await file.exists()) {
      final content = await file.readAsString();

      if (content.isNotEmpty) {
        heroes = jsonDecode(content);
      }
    }
    heroes.add(hero.toJson());

    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(heroes),
      encoding: utf8,
    );
    print("Hjälte sparad till heroes.json!");
  }

  @override
  Future<HeroModel> searchHero() {
    // TODO: implement searchHero
    throw UnimplementedError();
  }
}
