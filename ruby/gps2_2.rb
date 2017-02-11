# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Create an empty hash
  # separate string into an array of individual items
  # make each one a key for a hash with a default quantity
# output: A hash of the items with default quantities

def make_list(item_string = "")
  grocery_list = {}
  items_array = item_string.split(" ")
  #puts items_array

  items_array.each do |shopping_item|
    grocery_list[shopping_item] = 1
  end
  
  puts grocery_list
  return grocery_list  
end




# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
  # make item name
# output:

def add_item(grocery_list, item_name, quantity=1)
  grocery_list[item_name] = quantity
  puts grocery_list
  return grocery_list
end


# Method to remove an item from the list
# input:
# steps:
# output:

def remove_item(grocery_list, item_name)
  grocery_list.delete(item_name)
  puts grocery_list
  return grocery_list
end

# Method to update the quantity of an item
# input:
# steps:
# output:

def change_quantity(grocery_list, item_name, quantity)
  grocery_list[item_name] = quantity
  puts grocery_list
  return grocery_list
end

# Method to print a list and make it look pretty
# input:
# steps:
# output:
def print_list(grocery_list)
  grocery_list.each do |item, quantity|
    puts "#{item}: quantity: #{quantity}"
  end
end

#===================Driver Code===================
=begin
grocery_list = make_list("carrots apples cereal pizza")

add_item(grocery_list, "pears", 4)
puts grocery_list

remove_item(grocery_list, "pears")
puts grocery_list

change_quantity(grocery_list, "pizza", 100)
puts grocery_list

print_list(grocery_list)
=end

grocery_list = make_list
add_item(grocery_list, "Lemonade", 2)
add_item(grocery_list, "Tomatoes", 3)
add_item(grocery_list, "Onions", 1)
add_item(grocery_list, "Ice Cream", 4)
remove_item(grocery_list, "Lemonade")
change_quantity(grocery_list, "Ice Cream", 1)
print_list(grocery_list)