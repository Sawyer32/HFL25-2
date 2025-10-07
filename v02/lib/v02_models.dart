enum MenuOptions {
  main,
  create,
  newHero,
  list,
  search,
  exit
}

class Hero {
  final String name;
  final int level;
  final HeroType type;
  final HeroAttributes attributes;

  Hero({required this.name, required this.level, required this.type, required this.attributes});

  factory Hero.fromJson(Map<String, dynamic> json) {
    return Hero(
      name: json['name'],
      level: json['level'],
      type: HeroType.fromJson(json['type']),
      attributes: HeroAttributes.fromJson(json['attributes'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'level': level,
      'attributes': attributes.toJson(),
      'type': type.toJson()
    };
  }
}

class HeroType {
  final String race;
  final String faction;

  HeroType(this.race, this.faction);

  factory HeroType.fromJson(Map<String, dynamic> json) {
    return HeroType(json['race'], json['faction']);
  }

  Map<String, dynamic> toJson() {
    return {
      'race': race,
      'faction': faction,
    };
  }
}

class HeroAttributes {
  final int strength;
  final int stamina;

  HeroAttributes({required this.strength, required this.stamina});

  factory HeroAttributes.fromJson(Map<String, dynamic> json) {
    return HeroAttributes(strength: json['strength'], stamina: json['stamina']);
  }

  Map<String, dynamic> toJson() {
    return {
      'strength': strength,
      'stamina': stamina
    };
  }
}