import 'dart:convert';
import 'dart:io';

import 'package:v03/v03_models.dart';

abstract class HeroDataManaging {
  int idIncrement = 0;
  Future<void> saveHero(HeroModel hero);
  Future<void> getHeroList();
  Future<HeroModel> searchHero();
}

class HeroDataManager implements HeroDataManaging {
  List<Map<String, dynamic>> heroList = [];
  @override
  int idIncrement;

  HeroDataManager._() : idIncrement = 0;
  static final HeroDataManager _instance = HeroDataManager._();

  factory HeroDataManager() => _instance;

  @override
  Future<List<Map<String, dynamic>>> getHeroList() async {
    final file = File('heroes.json');
    if (!await file.exists()) {
      return [];
    }

    final content = await file.readAsString();

    if (content.trim().isEmpty) {
      return [];
    }

    var result = List<Map<String, dynamic>>.from(jsonDecode(content));

    return result;
  }

  @override
  Future<void> saveHero(HeroModel hero) async {
    final file = File("heroes.json");

    if (await file.exists()) {
      final content = await file.readAsString();

      if (content.isNotEmpty) {
        heroList = List<Map<String, dynamic>>.from(jsonDecode(content));
      }
    }
    heroList.add(hero.toJson());

    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(heroList),
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
