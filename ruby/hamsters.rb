puts "What is the hamster's name?"
hamster_name = gets.chomp
puts "How loud is your hamster? (1-10)"
hamster_volume = gets.chomp
puts "What color is your hamster's fur?"
hamster_color = gets.chomp
puts "Is it a good candidate for adoption? (Y/N)"
hamster_adopt = gets.chomp
puts "What is your hamster's age, roughly?"
hamster_age = gets.chomp

if hamster_age == ""
  hamster_age = nil
else
  hamster_age = hamster_age.to_i
end

hamster_volume = hamster_volume.to_i

if hamster_adopt.downcase == "y" || hamster_adopt.downcase == "yes"
  hamster_adopt = true
else
  hamster_adopt = false
end

puts "Hamster's name: #{hamster_name}"
puts "Hamster noise level: #{hamster_volume}"
puts "Hamster's fur color: #{hamster_color}"
puts "Is hamster adoptable: #{hamster_adopt}"
puts "Hamster's age: #{hamster_age}"