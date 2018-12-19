const matrix = require('./build/Release/addon');

// Returns & logs a string (test function)
// console.log(matrix.Hello());

// Create MATRIX LEDs
var leds = [];
for (i = 0; i < matrix.led().length; i++){
  leds.push({
    red: 1,
    green: 0,
    blue: 1,
    white: 0
  })}
// Set MATRIX LEDs
matrix.led().set(leds);