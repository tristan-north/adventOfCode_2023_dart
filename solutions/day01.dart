import 'dart:io';
import 'dart:convert';

void main() {
  final input = File('input/day01_input.txt').readAsStringSync();
  final lines = LineSplitter.split(input);

  final sum = lines.fold(0, (sum, line) => sum + getNumberFromLine(line));

  print('Part One solution: $sum');
}

int getNumberFromLine(String line) {
  final isNumber = (String c) => int.tryParse(c) != null;

  final chars = line.split('');
  final first = chars.firstWhere(isNumber);
  final last = chars.lastWhere(isNumber);

  return int.parse('$first$last');
}
