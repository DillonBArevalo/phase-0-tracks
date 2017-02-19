/*
For the longest phrase problem:
I'm going to create an empty string, iterate through the list, and compare lengths. when array[i] is longer than my string, i'll set string to array[i]
*/

function longest_phrase(phrases) {
  var longest = "";
  for (var i = 0; i < phrases.length; i++) {
    if (longest.length < phrases[i].length) {
      longest = phrases[i];
    };
  };
  return longest;
};

/*
For key value match:
create a list of the keys in each object. 
iterate through keys on one, then in that iteration, iterate through the other. 
if i find a match, check the values. if they match return true.
*/

function key_value_match(obj1, obj2) {
  var keys1 = Object.keys(obj1);
  var keys2 = Object.keys(obj2);
  for (var i = 0; i < keys1.length; i++) {
    for (var j = 0; j < keys2.length; j++) {
      if (keys1[i] == keys2[j]) {
        if (obj1[keys1[i]] == obj2[keys2[j]]) {
          return true;
        };
      };
    };
  };
  return false;
};

/*
For random string generator:
create a string of the alphabet/ any other characters I want to use in my strings
create an empty array
create a for loop for running the string creator with an empty string created in it
create a for loop with while i<= random number.
add to empty string with letter generated randomly from my alphabet
end inner loop and push string into array
end outer loop and return array.
*/

function string_generator(number_of_words) {
  var alphabet = "abcdefghijklmnopqrstuvwxyz";
  var created_words = [];
  for (var i=0; i<number_of_words; i++) {
    var word = "";
    for (var j=0; j<(Math.floor(Math.random()*10))+1; j++) {
      word += alphabet[Math.floor(Math.random()*alphabet.length)];
    };
    created_words.push(word);
  };
  return created_words;
};

//============Driver Code=============

console.log(longest_phrase(["long phrase","longest phrase","longer phrase"]));
console.log(longest_phrase(["long phrase","longer phrase","longest phrase"]));
console.log(key_value_match({name: "Steven", age: 54}, {name: "Tamir", age: 54}));
console.log(key_value_match({name: "Steven", age: 54}, {name: "Tamir", age: 52}));
console.log(string_generator(10))