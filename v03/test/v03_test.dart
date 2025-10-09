import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:v03/v03_helpers.dart';
import 'package:v03/v03_models.dart';

void main() {
  test('create hero', () async {
    
    const String testFile = 'test_heroes.json';
    final File file = File(testFile);
    if (await file.exists()) {
      await file.delete();
    }

    final Hero testHero = Hero(
      name: 'Ruben', 
      level: 1, 
      type: HeroType("Alv", "God"), 
      attributes: HeroAttributes(strength: 10, stamina: 10)
    );

    await saveHeroToFile(testHero, filePath: testFile);

    final content = await file.readAsString();
    final heroes = jsonDecode(content);

    expect(heroes.length, equals(1));
    expect(heroes[0]['name'], equals("Ruben"));
    
    await file.delete();
  });
}
