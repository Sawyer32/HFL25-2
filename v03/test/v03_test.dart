import 'package:test/test.dart';
import 'package:v03/v03_models.dart';

import 'mockManager/mock_manager.dart';

void main() {
  test('Initialize hero', () async {
    final _mock = MockHeroDataManager();
    await _mock.initializeHeroes();
    final heroes = _mock.heroes;
    expect(heroes.length, 1);
  });

  test('Create hero', () async {
    final hero = HeroModel(
      response: "200",
      id: "1",
      name: "New mock",
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

    final _mock = MockHeroDataManager();

    await _mock.saveHero(hero);
    final heroes = _mock.heroes;

    expect(heroes.firstWhere((h) => h.name == hero.name).name, "New mock");
  }); 
}
