import 'package:test/test.dart';

import 'mockManager/mock_manager.dart';


void main() {
  test('Initiera hjältar', () async {
    final manager = MockHeroDataManager();
    await manager.initializeHeroes();
    expect(await manager.getHeroList(), isNotEmpty);
  });

  test('Sök hjälte via namn', () async {
    final manager = MockHeroDataManager();
    await manager.initializeHeroes();

    final hero = await manager.searchHero("MockHero");
    expect(hero, isNotNull);
    expect(hero?.name, equals("MockHero"));
  });
}
