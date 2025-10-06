import 'dart:io';

void clearTerminal() {
  if (Platform.isWindows) {
    stdout.write('\x1B[2J\x1B[0;0H');
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}
