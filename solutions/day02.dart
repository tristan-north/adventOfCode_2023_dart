import 'dart:io';

const cubeLimits = {'red': 12, 'green': 13, 'blue': 14};

void main() {
  final input = File('input/day02_input.txt').readAsLinesSync();

  int solutionAccum = 0;
  for (final (i, line) in input.indexed) {
    // Match on eg '15 red'
    final matches = RegExp(r'(\d+) (red|green|blue)').allMatches(line);

    // Handle null matches here
    final matchStrings = [for (final match in matches) ?match.group(0)];

    final valid = matchStrings.every((str) => withinCubeLimit(str));

    if (valid) solutionAccum += i + 1; // +1 because game ids start at 1
  }

  print('Part One Solution: $solutionAccum');
}

// Takes a string like "4 red" or "2 green" and returns if it's
// within the limits specified by the cubeLimits constant.
bool withinCubeLimit(String str) {
  final [nChr, color] = str.split(' ');

  final n = int.parse(nChr);

  return n <= cubeLimits[color]!;
}
