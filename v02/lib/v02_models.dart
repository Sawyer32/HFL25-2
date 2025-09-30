class Hero {
  String name;
  final int level;
  final Stats stats;

  Hero({required this.name, required this.level, required this.stats});
}

class Stats {
  int strength;
  final int stamina;

  Stats({required this.strength, required this.stamina});
}

class Appearance {
  final String gender;
  final String race;

  Appearance({required this.gender, required this.race});
}