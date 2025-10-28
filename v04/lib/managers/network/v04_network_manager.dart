import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:v04/managers/network/abstracts/v04_network_abstract.dart';
import 'package:v04/models/v04_models.dart';

class V04NetworkManager implements NetworkManager {    
  @override
  Future<List<HeroModel>?> fetchHeroByName(String name) async {
    final DotEnv env = DotEnv(includePlatformEnvironment: true)..load();
    final apiKey = env['API_KEY'];

    try {
      final url = Uri.https('superheroapi.com', '/api/$apiKey/search/$name');
      final response = await http.get(url);

      if (response.statusCode != 200) {
        stdout.writeln('HTTP error: ${response.statusCode}');
        return null;
      }

      final data = jsonDecode(response.body);

      if (data['response'] == 'error' || data['results'] == null) {
        stdout.writeln('Ingen hjälte hittad vid namn "$name"');
        return null;
      }

      final results = data['results'];
      if (results is! List) {
        stdout.writeln('Oväntat format på results för $name');
        return null;
      }

      return results.map((hero) => HeroModel.fromJson(hero)).toList();
    } catch (e) {
      stdout.writeln('Misslyckades med att hämta hjälte: $e');
      return null;
    }
  }
}