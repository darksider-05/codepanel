import 'dart:io';

void main() async {
  bool cont = true;

  var scrDir = File(Platform.script.toFilePath()).parent;
  var configFile = File('${scrDir.path}${Platform.pathSeparator}config.txt');

  if (!await configFile.exists()) {
    print("config.txt not found in ${scrDir.path}");
    return;
  }

  var initialPath = (await configFile.readAsString()).trim();
  var directory = Directory(initialPath);

  if (!await directory.exists()) {
    print("Directory '$initialPath' does not exist.");
    return;
  }

  while (cont) {
    bool cont2 = true;
    stdout.write('\x1B[2J\x1B[0;0H');
    var contents = directory.listSync().whereType<Directory>();
    var names = [];
    var vnames = [];

    for (var dir in contents) {
      var parts = dir.path.split(Platform.pathSeparator);
      var name = parts.last;
      vnames.add("${names.length + 1}. $name");
      names.add(name);
    }
    stdout.writeln(
      "\n\n\x1B[34myou are in the '${directory.path.split(Platform.pathSeparator).join("/").replaceFirst(":", "")}' directory\x1B[0m",
    );
    stdout.writeln("\n\nSub Directories:");
    stdout.writeAll(vnames, "\n");
    while (cont2) {
      stdout.writeln("\n\n\nplease choose an action:");
      stdout.writeln("\x1B[31me => exit\x1B[0m");
      stdout.writeln("\x1B[33mu => upper directory\x1B[0m");
      stdout.writeln("\x1B[32mo => open in vscode\x1B[0m");
      stdout.writeln("\x1B[32mf => open in file explorer\x1B[0m");
      stdout.writeln(
        "\x1B[34m'numbers'\x1B[0m to open the corresponding folder",
      );
      var inp = stdin.readLineSync() ?? "";

      switch (inp) {
        case "e":
          cont = false;
          cont2 = false;
          break;
        case "u":
          directory = directory.parent;
          cont2 = false;
          break;
        case "f":
          if (Platform.isWindows) {
            await Process.run('explorer', [directory.path]);
          } else if (Platform.isMacOS) {
            await Process.run('open', [directory.path]);
          } else if (Platform.isLinux) {
            await Process.run('xdg-open', [directory.path]);
          } else {
            print('Unsupported platform');
            stdin.readLineSync();
          }
          cont2 = false;
          cont = false;
          break;
        case "o":
          if (Platform.isWindows) {
            await Process.run('cmd', [
              '/c',
              'code .',
            ], workingDirectory: directory.path);
          } else {
            await Process.run('bash', [
              '-c',
              'code .',
            ], workingDirectory: directory.path);
          }
          cont2 = false;
          cont = false;
          break;
        default:
          if (int.tryParse(inp) != null) {
            var intt = int.parse(inp);
            if (intt <= names.length && intt >= 1) {
              directory = Directory(
                "${directory.path}${Platform.pathSeparator}${names[intt - 1]}",
              );
              cont2 = false;
              break;
            } else {
              print("range out of bound");
              break;
            }
          } else {
            print("that wasn't neither a number nor valid command");
            break;
          }
      }
    }
  }
}
