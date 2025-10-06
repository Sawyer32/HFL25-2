import 'dart:convert';
import 'dart:io';

import 'package:v02/v02.dart' as v02;

void main(List<String> arguments) {
  gameHandler();
}

String mainMenu() {
  print("1. Skapa hjälte");
  print("2. Visa alla hjältar");
  print("3. Avsluta");
  stdout.write("Välj alternativ: ");
  String input = stdin.readLineSync() ?? "";
  return input;
}

String listHeroesMenu() {
  clearTerminal();
  print("1. Tillbaka");
  stdout.write("Välj alternativ: ");
  String input = stdin.readLineSync() ?? "";
  if (input.isNotEmpty) clearTerminal();
  return input;
}


void clearTerminal() {
  if (Platform.isWindows) {
    stdout.write('\x1B[2J\x1B[0;0H');
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}


void gameHandler() {
  bool isRunning = true;
  String input = "";
  clearTerminal();

  while(isRunning) {
    switch(input) {
      case "2":
        input = listHeroesMenu();
      case "3":
        exit(0);
      default:
        input = mainMenu();
        break;
      
    }
  }
}

