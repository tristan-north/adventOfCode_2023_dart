import 'dart:io';
import 'dart:convert';

void main() {
  final input = File('input/day01_example.txt').readAsStringSync();
  final lines = LineSplitter.split(input);

  // {
  //   final sum = lines.fold(0, (sum, line) => sum + getNumberFromLine(line));
  //   print('Part One solution: $sum');
  // }

  getNumberInclStringFromLine(lines.first);
  // lines.forEach(getNumberInclStringFromLine);
  // {
  //   final sum = lines.fold(
  //     0,
  //     (sum, line) => sum + getNumberInclStringFromLine(line),
  //   );
  //   print('Part Two solution: $sum');
  // }
}

int getNumberFromLine(String line) {
  final isNumber = (String c) => int.tryParse(c) != null;

  final chars = line.split('');
  final first = chars.firstWhere(isNumber);
  final last = chars.lastWhere(isNumber);

  return int.parse('$first$last');
}

enum nums { one, two, three, four, five, six, seven, eight, nine }

int getNumberInclStringFromLine(String line) {
  print(line);
  for (final n in nums.values) {
    final matchIndex = line.indexOf(n.name);
    if (line.allMatches(n.name).firstOrNull != null) {
    //   print('${n.name}');
    // }
  }

  return 0;
}
