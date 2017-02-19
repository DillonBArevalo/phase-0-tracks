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
        if (obj1(keys1[i]) == obj2(keys2[j])) {
          return true;
        };
      };
    };
  };
};


//============Driver Code=============

console.log(longest_phrase(["long phrase","longest phrase","longer phrase"]))
console.log(longest_phrase(["long phrase","longer phrase","longest phrase"]))
