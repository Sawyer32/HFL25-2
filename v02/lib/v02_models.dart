import 'dart:io';

enum MenuOptions {
  main,
  create,
  list,
  search,
  exit
}

class Hero {
  final String name;
  int level;
  final HeroType type;
  final HeroAttribute attribute;

  Hero(this.name, this.level, this.type, this.attribute);
}

class HeroType {
  final String race;
  final String faction;

  HeroType(this.race, this.faction);
}

class HeroAttribute {
  final int Strength;
  final int Stamina;

  HeroAttribute(this.Strength, this.Stamina);
}