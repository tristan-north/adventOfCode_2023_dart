// Loop through each character. Digits accumulate into serialNumBuf.
// If any digit in the buffer is adjacent to a symbol, the 'symbolNear' flag is
// set to true. Upon hitting a non-digit char, the buffer is appended to
// validSerialNumbers if the flag is set.

// validSerialNumbers = []

// for each character c:
//   if (c is not digit):
//     if (serialNumBuf.length > 0) // Just left a serial num
//       if (symbolNear == true)
//         validSerialNumbers.append(serialNumBuf)

//     // Reset state
//     symbolNear = false
//     serialNumBuf.clear()
//     continue

//   adjacent_chars = get_adjacent_chars();

//   if (symbol in adjacent_chars):
//     symbolNear = true

//   serialNumBuf.append(c);

import 'dart:io';

void main() {
  final validSerialNumbers = <String>[];

  final input = File('input/day02_input.txt').readAsLinesSync();

  for (final line in input) {
    var serialNumBuf = '';
    var symbolNear = false;

    for (final c in line.split('')) {
      final intVal = int.tryParse(c);
      if (intVal == null) {
        if (serialNumBuf.length > 0) {
          // Just left a serial num

          if (symbolNear == true) {
            validSerialNumbers.add(serialNumBuf);
          }

          // Reset state
          symbolNear = false;
          serialNumBuf = '';
        }
        continue;
      }
      // Is a digit
      else {
        final adjacentChars = getAdjacentChars();
        if (adjacent_chars.contains(symbol)) symbolNear = true;

        serialNumBuf += (c);
      }
    }
  }
}
