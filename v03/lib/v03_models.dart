enum MenuOptions {
  main,
  create,
  newHero,
  list,
  search,
  exit
}

class HeroModel {
  final String response;
  final String id;
  final String name;
  final HeroPowerStats powerstats;
  final HeroBiography biography;
  final HeroAppearance appearance;
  final HeroWork work;
  final HeroConnection connections;
  final HeroImage image;

  HeroModel({required this.response, required this.id, required this.name, required this.powerstats, required this.biography, required this.appearance, required this.work, required this.connections, required this.image});

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      response: json['response'],
      id: json['id'],
      name: json['name'],
      powerstats: HeroPowerStats.fromJson(json['powerstats']),
      biography: HeroBiography.fromJson(json['biography']),
      appearance: HeroAppearance.fromJson(json['appearance']),
      work: HeroWork.fromJson(json['work']),
      connections: HeroConnection.fromJson(json['connections']),
      image: json['image']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response': response,
      'id': id,
      'name': name,
      'powerstats': powerstats,
      'biography': biography,
      'appearance': appearance,
      'work': work,
      'connections': connections,
      'image': image
    };
  }
}

class HeroPowerStats {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  HeroPowerStats(this.intelligence, this.strength, this.speed, this.durability, this.power, this.combat);

  factory HeroPowerStats.fromJson(Map<String, dynamic> json) {
    return HeroPowerStats(
      json['intelligence'],
      json['strength'],
      json['speed'],
      json['durability'],
      json['power'],
      json['combat']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'intelligence': intelligence,
      'strength': strength,
      'speed': speed,
      'durability': durability,
      'power': power,
      'combat': combat
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