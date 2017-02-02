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

puts "Do you have any pets?"
pets=gets.chomp.downcase
if pets=="yes" || pets=="y"
  pets=true
else
  pets=false
end
client_info[:pets_y_n]=pets

puts "At what email can we reach you?"
email=gets.chomp
client_info[:email]=email

puts "Is there anything else you want us to know?"
extra=gets.chomp
client_info[:additional_info]=extra

puts client_info

puts "Would you like to update any of this data? (enter they key of the data to be changed or none if you don't want to change anything)"
change_key=gets.chomp

if change_key != "none" #if clause for replacing data type
  if change_key[0]==":" #if clause for converting change_key to sym
    change_key = change_key[1..-1].intern
  else
    change_key = change_key.intern
  end
  puts "What would you like the new data to be?"
  new_value=gets.chomp
  if change_key == :pets_y_n #if clause for making sure we get the right data type
    if new_value.downcase=="yes" || new_value.downcase=="y"
      new_value=true
    else
      new_value=false
    end
  elsif change_key == :age || change_key == :number_of_children || change_key == :phone_number #this elsif is for number data types
    new_value.delete!("-")
    new_value.delete!(".")
    new_value.delete!(" ")
    #the above three lines are to make sure it's in the right format (just a string of numbers)
    new_value=new_value.to_i
  end
  client_info[change_key] = new_value
end

puts client_info