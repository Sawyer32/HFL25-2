import 'dart:convert';
import 'dart:io';

import 'package:uuid/uuid.dart';
import 'package:v04/v04_models.dart';
import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;

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
    final DotEnv env = DotEnv(includePlatformEnvironment: true)..load();
    final apiKey = env['API_KEY'];
    final bool existingHero = heroList.any((hero) => hero.name.toLowerCase() == name.toLowerCase());

    if (existingHero) {
      return heroList.firstWhere((hero) => hero.name.toLowerCase() == name.toLowerCase());
    }

    try {
        final url = Uri.https('superheroapi.com', '/api/$apiKey/search/$name');
        final response = await http.get(url);

        if (response.statusCode != 200) {
          stdout.writeln('HTTP error: ${response.statusCode}');
          return null;
        }

        final data = jsonDecode(response.body);

        if (data['response'] == 'error' || data['results'] == null) {
          stdout.writeln('Ingen hjälte hittad vid namn "$name"');
          return null;
        }

        final results = data['results'] as List;

        final newHeroes = results.map((e) => HeroModel.fromJson(e)).toList();
        heroList.addAll(newHeroes);
      
        final found = newHeroes.firstWhere((hero) => hero.name.toLowerCase() == name.toLowerCase());
        
        return found;
      
    } catch (e) {
      stdout.writeln('Misslyckades att hämta hjälte: $e');
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

    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(jsonHeroList),
      encoding: utf8,
    );

    print("Hjälte sparad till heroes.json!");
  }
}
