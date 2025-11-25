// Loop through each character. Digits accumulate into serialNumBuf. 
// If any digit in the buffer is adjacent to a symbol, the 'symbolNear' flag is set to true.
// Upon hitting a non-digit char, the buffer is appended to validSerialNumbers if the flag is set.

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


