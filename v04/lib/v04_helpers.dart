import 'dart:convert';
import 'dart:io';

import 'package:v03/v04_models.dart';

void clearTerminal() {
  if (Platform.isWindows) {
    stdout.write('\x1B[2J\x1B[0;0H');
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

String selectOption() {
  stdout.write("Välj alternativ: ");
  String input = stdin.readLineSync() ?? "";
  return input;
}

Future<void> saveHeroToFile(
  HeroModel hero, {
  String filePath = 'heroes.json',
}) async {
  final file = File(filePath);

  List<dynamic> heroes = [];

  if (await file.exists()) {
    final content = await file.readAsString();

    if (content.isNotEmpty) {
      heroes = jsonDecode(content);
    }
  }
  heroes.add(hero.toJson());

  await file.writeAsString(
    const JsonEncoder.withIndent('  ').convert(heroes),
    encoding: utf8,
  );
  print("Hjälte sparad till $filePath!");
}

Future<List<dynamic>> readHeroesFromJson() async {
  final file = File('heroes.json');

  if (!await file.exists()) {
    return [];
  }

  final content = await file.readAsString();

  if (content.trim().isEmpty) {
    return [];
  }

  return jsonDecode(content);
}
