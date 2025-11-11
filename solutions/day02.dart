import 'dart:io';

const cubeLimits = (red: 12, green: 13, blue: 14);

void main() {
  final input = File('input/day02_example.txt').readAsLinesSync();

  // Next add up the game numbers which pass and try making
  // a big filter pipe.

  input.forEach((line) {
    final gameDataStr = line.split(':').skip(1).first;

    // TODO: Fix this abomination
    final gameData = gameDataStr
        .split(';')
        .map((n) => n.split(',').map((j) => j.trim()).toList().toList())
        .toList();

    print('$gameData');

    final valid = gameData.expand((x) => x).every((x) => withinCubeLimit(x));
    print('valid: $valid');
  });
}

bool withinCubeLimit(String str) {
  final [nChr, color] = str.split(' ');

  final n = int.parse(nChr);

  switch (color) {
    case 'red' when n > cubeLimits.red:
    case 'green' when n > cubeLimits.green:
    case 'blue' when n > cubeLimits.blue:
      return false;
  }

  return true;
}
