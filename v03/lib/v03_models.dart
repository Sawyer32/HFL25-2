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

class HeroImage {
  final String url;

  HeroImage(this.url);

  factory HeroImage.fromJson(Map<String, dynamic> json) {
    return HeroImage(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}

class HeroConnection {
  final String groupAffiliation;
  final List<String> relative;

  HeroConnection(this.groupAffiliation, this.relative);

  factory HeroConnection.fromJson(Map<String, dynamic> json) {
    return HeroConnection(json['group-affiliation'], json['relatives']);
  }

  Map<String, dynamic> toJson() {
    return {
      'group-affiliation': groupAffiliation,
      'relatives': relative
    };
  }
}

class HeroWork {
  String occupation;
  String base;

  HeroWork(this.occupation, this.base);

  factory HeroWork.fromJson(Map<String, dynamic> json) {
    return HeroWork(json['occupation'], json['base']);
  }

  Map<String, dynamic> toJson() {
    return {
      'occupation': occupation,
      'base': base
    };
  }
}

class HeroAppearance {
  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  HeroAppearance(this.gender, this.race, this.height, this.weight, this.eyeColor, this.hairColor);

  factory HeroAppearance.fromJson(Map<String, dynamic> json) {
    return HeroAppearance(json['gender'], json['race'], json['height'], json['weight'], json['eye-color'], json['hair-color']);
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'race': race,
      'height': height,
      'weight': weight,
      'eye-color': eyeColor,
      'hair-color': hairColor
    };
  }
}

class HeroBiography {
  final String fullName;
  final List<String> alterEgo;
  final List<String> alias;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;
  
  HeroBiography(this.fullName, this.alterEgo, this.alias, this.placeOfBirth, this.firstAppearance, this.publisher, this.alignment);

  factory HeroBiography.fromJson(Map<String, dynamic> json) {
    return HeroBiography(json['fullName'], json['alterEgo'], json['alias'], json['placeOfBirth'], json['firstAppearance'], json['publisher'], json['alignment']);
  }

  Map<String, dynamic> toJson() {
    return {
      'full-name': fullName,
      'alter-egos': alterEgo,
      'aliases': alias,
      'place-of-birth': placeOfBirth,
      'first-appearance': firstAppearance,
      'publisher': publisher,
      'alignment': alignment
    };
  }
}