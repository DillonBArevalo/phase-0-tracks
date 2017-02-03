=begin
write a method that takes consonants into next ones
use .next! (after excepting z) and loop checking if it's a vowel, in which case we next it again.

write a method that takes vowels into the next one
make an if statement to change each vowel to the next one

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

$consonants="bcdfghjklmnpqrstvwxyz"

$vowels="aeiou"

def vowel_changer(vowel)
  if vowel== "a"
    vowel = "e"
  elsif vowel == "e"
    vowel = "i"
  elsif vowel == "i"
    vowel = "o"
  elsif vowel == "o"
    vowel = "u"
  else 
    vowel = "a"
  end
  vowel
end

#checks:
#puts vowel_changer("a")
#puts vowel_changer("e")
#puts vowel_changer("i")
#puts vowel_changer("o")
#puts vowel_changer("u")

def consonant_changer(consonant)
  if consonant == "z"
    consonant = "b"
    return consonant
  end
  consonant.next!
  if !$consonants.include?(consonant)
    consonant.next!
  end
  consonant
end

#checks:
#consonants = "bcdfghjklmnpqrstvwxyz"
#consonants=consonants.split("")
#puts consonants
#consonants.each {|consonant| puts consonant_changer(consonant)}

def alias_maker(name)
  names = name.split(" ")
  names.reverse!
  names.map! {|name| name.split("")}
  #p names
end

alias_maker("Dillon Arevalo")