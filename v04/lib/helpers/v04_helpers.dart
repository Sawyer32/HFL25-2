import 'dart:io';

import 'package:v04/models/v04_models.dart';

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

void PrintHero(HeroModel hero) {
  stdout.writeln(
        "Name: ${hero.name}\n"
        "Intellekt: ${hero.powerstats?.intelligence}\n"
        "Styrka: ${hero.powerstats?.strength}\n"
        "Snabbhet: ${hero.powerstats?.speed}\n"
        "Uthållighet: ${hero.powerstats?.durability}\n"
        "Kraft: ${hero.powerstats?.power}\n"
        "Stridsförmåga: ${hero.powerstats?.combat}\n"
        "Fullständigt namn: ${hero.biography?.fullName}\n"
        "Alter egos: ${hero.biography?.alterEgo}\n"
        "Alias: ${hero.biography?.alias}\n"
        "Födelseort: ${hero.biography?.placeOfBirth}\n"
        "Första framträdande: ${hero.biography?.firstAppearance}\n"
        "Utgivare: ${hero.biography?.publisher}\n"
        "Tillhörighet: ${hero.biography?.alignment}\n"
        "Kön: ${hero.appearance?.gender}\n"
        "Ras: ${hero.appearance?.race}\n"
        "Längd: ${hero.appearance?.height}\n"
        "Vikt: ${hero.appearance?.weight}\n"
        "Ögonfärg: ${hero.appearance?.eyeColor}\n"
        "Hårfärg: ${hero.appearance?.hairColor}\n"
        "Arbete: ${hero.work?.occupation}\n"
        "Arbetsplats: ${hero.work?.base}\n"
        "Grupp: ${hero.connections?.groupAffiliation}\n"
        "Anhöriga: ${hero.connections?.relative}\n"
        "Bild: ${hero.image?.url}\n"
        "================"
      );
}