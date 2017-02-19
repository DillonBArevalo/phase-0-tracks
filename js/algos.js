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



//============Driver Code=============

console.log(longest_phrase(["long phrase","longest phrase","longer phrase"]))
console.log(longest_phrase(["long phrase","longer phrase","longest phrase"]))
