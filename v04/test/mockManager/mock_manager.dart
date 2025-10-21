import 'dart:convert';
import 'dart:io';

import 'package:uuid/uuid.dart';
import 'package:v04/v04_manager.dart';
import 'package:v04/v04_models.dart';

class MockHeroDataManager implements HeroDataManaging {
  List<HeroModel> heroes = [];
  final _uuid = const Uuid();

  @override
  Future<List<HeroModel>> getHeroList() async {
    return heroes;
  }

  @override
  Future<void> initializeHeroes() async {
    final HeroModel hero = HeroModel(
      response: "200",
      id: "1",
      name: "Mock",
      powerstats: HeroPowerStats("10", "20", "100", "90", "300", "123"),
      biography: HeroBiography(
        "Mock Hero",
        ["Ego1", "Ego2"],
        ["Alias1", "Alias2"],
        "Mock town",
        "Mock vol 1",
        "Mock & Co",
        "Good",
      ),
      appearance: HeroAppearance(
        "Male",
        "Human",
        {'cm': "173", "inches": "5'7"},
        {'kg': "75", "lbs": "93"},
        "Black",
        "Black",
      ),
      work: HeroWork("Unemployed", "Basement"),
      connections: HeroConnection("No affiliation", "None"),
      image: HeroImage("image url"),
    );
    
    heroes.add(hero);
  }

  @override
  Future<void> saveHero(HeroModel hero) async {
    hero.id ??= _uuid.v4();
    heroes.add(hero);
  }

  @override
  Future<HeroModel?> searchHero(String name) async {
    try {
      return heroes.firstWhere((hero) => hero.name.toLowerCase() == name.toLowerCase());
    } catch (e) {
      return null;
    }
  }
}
