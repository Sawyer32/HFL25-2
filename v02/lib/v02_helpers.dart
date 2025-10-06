import 'dart:io';

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
  if (input.isEmpty) {
    stdout.writeln("Du måste göra ett val");
    input = stdin.readLineSync() ?? "";
  }
  
  return input;
}