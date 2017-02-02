=begin
Create hash with all the desired fields set to nil
Ask for each data point separately as looping won't easily work because we'll want different questions for each one
print the hash using puts
ask for update of key
change the key if not none
print hash again
=end

client_info = {
  name: nil, 
  age: nil, 
  number_of_children: nil, 
  decor_theme: nil,
  phone_number: nil,
  pets_y_n: nil,
  email: nil,
  additional_info: nil
}

puts "What is your name?"
name=gets.chomp
client_info[:name] = name

puts "How old are you?"
age=gets.chomp.to_i
client_info[:age]=age

puts "How many children do you have?"
children=gets.chomp.to_i
client_info[:number_of_children]=children

puts "What decor theme would you like?"
theme=gets.chomp
client_info[:decor_theme]=theme

puts "What is your phone number?"
phone=gets.chomp
phone.delete!("-")
phone.delete!(".")
phone.delete!(" ")
#the above three lines are to make sure it's in the right format (just a string of numbers)
phone=phone.to_i
client_info[:phone_number]=phone

puts client_info