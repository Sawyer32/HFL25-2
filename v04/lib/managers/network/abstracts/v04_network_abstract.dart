import 'package:v04/models/v04_models.dart';

abstract class NetworkManager {
  Future<List<HeroModel>?> fetchHeroByName(String name);
}
