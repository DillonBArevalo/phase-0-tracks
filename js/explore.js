// function should take a string, set another empty string. iterate backwards through the letters of the input string and one by one add them to the new empty string. then return the no longer empty string
function reverser(string) {

  new_string = "";

  for (var i = string.length - 1; i >= 0; i--) {
    new_string += string[i];
  };

  return new_string;
};

// ===================DRIVER CODE==================

console.log(reverser("Hello"));
console.log(reverser("Racecar"));
console.log(reverser("I wanted to test something more complex"));
var reversed = reverser("tluser");

if (reversed == "result") {
  console.log(reversed);
};