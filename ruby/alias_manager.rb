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

def letter_changer(letter)
  if letter == letter.upcase #means it's a capital letter
    letter.downcase!

    if $consonants.include?(letter)
      letter = consonant_changer(letter)
    else
      letter = vowel_changer(letter)
    end

    letter.upcase!
  else

    if $consonants.include?(letter)
      letter = consonant_changer(letter)
    else
      letter = vowel_changer(letter)
    end        

  end
  return letter
end

#("a".."z").each {|letter| puts letter_changer(letter)}
#("A".."Z").each {|letter| puts letter_changer(letter)}


def alias_maker(full_name)
  names = full_name.split(" ")
  names.reverse!
  names.map! {|single_name| single_name.split("")}
  #p names
  names.map! do |name_array|

    name_array.map! do |letter|

       letter_changer(letter)

    end

  end
  #p names
  names.map! {|name_array| name_array.join}
  #p names
  full_name = names.join(" ")
  #p full_name
  full_name
end

#p alias_maker("Felicia Torres")

#now we make the user interface:

name_to_modify = ""
name_list = {}
until name_to_modify == "quit"
  puts "Hello! What name would you like to modify? (enter 'quit' to exit)"
  name_to_modify=gets.chomp

  if name_to_modify.downcase == "quit" || name_to_modify == ""
    name_to_modify.downcase!
    next
  end
  
  new_name = alias_maker(name_to_modify)
  puts new_name
  name_list[name_to_modify] = new_name
end
#p name_list

name_list.each {|original_name,alias_name| puts "#{original_name} is also known as #{alias_name}"}

#note that if a name is entered two different times, it will only store it once, though it will print out the alias every time it is entered.