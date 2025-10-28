import 'dart:convert';
import 'dart:io';

import 'package:uuid/uuid.dart';
import 'package:v04/managers/v04_manager.dart';
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
    response: "success",
    id: null,
    name: "MockHero",
    powerstats: HeroPowerStats("10", "20", "100", "90", "300", "123"),
    biography: HeroBiography("Full Name", ["Alter Ego"], ["Alias"], "Place of Birth", "First Appearance", "Publisher", "Good"),
    appearance: HeroAppearance(
      gender: "Male",
      race: "Human",
      height: ["180 cm", "5'11"],
      weight: ["80 kg", "176 lbs"],
      eyeColor: "Blue",
      hairColor: "Brown",
    ),
    connections: HeroConnection("Group Affiliation", "Relatives"),
    work: HeroWork("Occupation", "Base"),
    image: HeroImage("Image URL")
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
