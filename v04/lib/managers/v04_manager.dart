import 'dart:convert';
import 'dart:io';

import 'package:uuid/uuid.dart';
import 'package:v04/v04_models.dart';
import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:v04/managers/network/v04_network_manager.dart';

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
    final query = name.toLowerCase();
    try {
      return heroList.firstWhere((h) => h.name.toLowerCase() == query);
    } catch (_) {} 

    try {
      final results = await V04NetworkManager().fetchHeroByName(query);

      if (results != null && results.isNotEmpty) {
        for (var hero in results) {
          heroList.add(hero);
        }
      }
      return results?.first;
    } catch (e) {
      print('Fel vid nätverkssökning: $e');
    }
    
    return null;
  }
  
  @override
  Future<void> initializeHeroes() async {
    final file = File("heroes.json");
    try {
      if (await file.exists()) {
        final content = await file.readAsString();

        if (content.isNotEmpty) {
          final decoded = jsonDecode(content) as List<dynamic>;
          print('Decoded content: $decoded');
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
    final content = await file.readAsString();

    if (content == const JsonEncoder.withIndent('  ').convert(jsonHeroList)) {
      print("Inga ändringar att spara.");
      return;
    }

    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(jsonHeroList),
      encoding: utf8,
    );

    print("Hjälte sparad till heroes.json!");
  }

  Future<List<HeroModel>> goodHeroes() async {
    return heroList.where((h) => h.biography?.alignment.toLowerCase() == 'good').toList();
  }

  Future<List<HeroModel>> badHeroes() async {
    return heroList.where((h) => h.biography?.alignment.toLowerCase() == 'bad').toList();
  }

  Future<bool> removeHeroByName(String name) async {
    final initialLength = heroList.length;
    heroList.removeWhere((h) => h.name.toLowerCase() == name.toLowerCase());
    return heroList.length < initialLength;
  }
}
