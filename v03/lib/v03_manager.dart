import 'package:v03/v03_models.dart';

abstract class HeroDataManaging {
  Future<void> saveHero();
  Future<void> getHeroList();
  Future<Hero> searchHero();
}

class HeroDataManager implements HeroDataManaging {
  @override
  Future<void> getHeroList() {
    // TODO: implement getHeroList
    throw UnimplementedError();
  }

  @override
  Future<void> saveHero() {
    // TODO: implement saveHero
    throw UnimplementedError();
  }

  @override
  Future<Hero> searchHero() {
    // TODO: implement searchHero
    throw UnimplementedError();
  }

}