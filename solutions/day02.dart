import 'dart:io';

void main() {
  final input = File('input/day02_example.txt').readAsLinesSync();

  input.forEach(print);

  input.forEach((line) {
    final gameDataStr = line.split(':').skip(1).first;

    final rounds = gameDataStr.split(';');

    final gameData = gameDataStr
        .split(';')
        .map((n) => n.split(',').map((j) => j.trim()).toList().toList())
        .toList();

    print('$gameData');

    // Next create a function to take a string of a number and color
    // and do something useful with it?
  });
}
