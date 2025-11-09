import 'dart:io';
import 'dart:convert';

// TODO: Refine solution.

void main() {
  final input = File('input/day01_input.txt').readAsStringSync();
  final lines = LineSplitter.split(input);

  {
    final sum = lines.fold(0, (sum, line) => sum + getNumberFromLine(line));
    print('Part One solution: $sum');
  }

  {
    final sum = lines.fold(0, (sum, line) => sum + getNumberInclStringFromLine(line));
    print('Part Two solution: $sum');
  }
}

int getNumberFromLine(String line) {
  final isNumber = (String c) => int.tryParse(c) != null;

  final chars = line.split('');
  final first = chars.firstWhere(isNumber);
  final last = chars.lastWhere(isNumber);

  return int.parse('$first$last');
}

const targets = [
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '0',
];

int getNumberInclStringFromLine(String line) {
  int firstMatchIndex = 999;
  String firstMatch = '*';
  int lastMatchIndex = -1;
  String lastMatch = '*';
  for (final t in targets) {
    var matchIndex = line.indexOf(t);

    if (matchIndex == -1) continue;

    if (matchIndex < firstMatchIndex) {
      firstMatchIndex = matchIndex;
      firstMatch = t;
    }

    matchIndex = line.lastIndexOf(t);
    if (matchIndex == -1) continue;
    if (matchIndex > lastMatchIndex) {
      lastMatchIndex = matchIndex;
      lastMatch = t;
    }
  }

  // Convert eg 'six' to '6'
  var i = targets.indexOf(firstMatch);
  if (i < 9) firstMatch = targets[i + 9];
  i = targets.indexOf(lastMatch);
  if (i < 9) lastMatch = targets[i + 9];

  print(line);
  print('$firstMatch$lastMatch');

  return int.parse('$firstMatch$lastMatch');
}
