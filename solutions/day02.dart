import 'dart:io';

import 'package:collection/collection.dart';

const cubeLimits = {'red': 12, 'green': 13, 'blue': 14};

void main() {
  final input = File('input/day02_input.txt').readAsLinesSync();

  // Part One
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

  // Part Two
  solutionAccum = 0;
  for (final line in input) {
    final colors = ['red', 'green', 'blue'];

    final values = [for (final color in colors) maxBallsFromLine(line, color)];

    solutionAccum += values[0] * values[1] * values[2];
  }
  print('Part Two Solution: $solutionAccum');
}

// Takes a string like "4 red" or "2 green" and returns if it's
// within the limits specified by the cubeLimits constant.
bool withinCubeLimit(String str) {
  final [nChr, color] = str.split(' ');

  final n = int.parse(nChr);

  return n <= cubeLimits[color]!;
}

// Return the max value seen on the line for the given color
int maxBallsFromLine(String line, String color) {
  final matches = RegExp('(\\d+) $color').allMatches(line);

  final matchValues = [
    for (final match in matches) ?int.tryParse(match.group(1) ?? ''),
  ];

  return matchValues.max;
}
