import 'dart:io';
import 'dart:convert';

void main() {
  final input = File('input/day01_input.txt').readAsStringSync();
  final lines = LineSplitter.split(input);

  {
    final sum = lines.fold(0, (sum, line) => sum + getNumberFromLine(line));
    print('Part One solution: $sum');
  }

  {
    final sum = lines.fold(
      0,
      (sum, line) => sum + getNumberInclStringFromLine(line),
    );
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
  ({int idx, String char})? first;
  ({int idx, String char})? last;

  for (final t in targets) {
    {
      final matchIndex = line.indexOf(t);

      if (matchIndex == -1) continue;

      if (first == null || matchIndex < first.idx) {
        first = (idx: matchIndex, char: t);
      }
    }

    {
      final matchIndex = line.lastIndexOf(t);

      if (last == null || matchIndex > last.idx) {
        last = (idx: matchIndex, char: t);
      }
    }
  }

  final firstChar = possibleWordToNumber(first!.char);
  final lastChar = possibleWordToNumber(last!.char);

  return int.parse('$firstChar$lastChar');
}

// eg 'six' to '6'. If already '6' return '6'.
String possibleWordToNumber(String word) {
  final i = targets.indexOf(word);

  return i < 9 ? targets[i + 9] : word;
}
