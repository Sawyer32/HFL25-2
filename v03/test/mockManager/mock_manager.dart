import 'package:v03/v03_manager.dart';
import 'package:v03/v03_models.dart';

class MockHeroDataManager implements HeroDataManaging {
  List<HeroModel> heroes = [];

  @override
  Future<List<HeroModel>> getHeroList() async {
    return heroes;
  }

  @override
  Future<void> initializeHeroes() {
    final hero = HeroModel(
      response: "200", 
      id: "1", 
      name: "Mock", 
      powerstats: HeroPowerStats("10", "20", "100", "90", "300", "123"), 
      biography: HeroBiography("Mock Hero", ["Ego1", "Ego2"], ["Alias1", "Alias2"], "Mock town", "Mock vol 1", "Mock & Co", "Good"), 
      appearance: HeroAppearance("Male", "Human", {}, weight, eyeColor, hairColor), 
      work: work, 
      connections: 
      connections, 
      image: image
    );
  }

  @override
  Future<void> saveHero(HeroModel hero) {
    // TODO: implement saveHero
    throw UnimplementedError();
  }

  @override
  Future<HeroModel?> searchHero(String name) {
    // TODO: implement searchHero
    throw UnimplementedError();
  }

}