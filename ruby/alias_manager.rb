=begin
write a method that takes consonants into next ones
use .next! (after excepting z) and loop checking if it's a vowel, in which case we next it again.

write a method that takes vowels into the next one
gsub with each vowel to the next one

name method
Input name and save the variable
turn it into an array of words
reverse the order
break each word into an array of letters
for each letter: 
  check if vowel or consonant
  check if caps, if yes then de cap it and put it through the process then recap it
  if no, just put it through the process
put the sub arrays back into words
put the words together again
=end