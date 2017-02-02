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

puts client_info