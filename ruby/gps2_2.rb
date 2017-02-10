# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Create an empty hash
  # separate string into an array of individual items
  # make each one a key for a hash with a default quantity
# output: A hash of the items with default quantities

def make_list(item_string)
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

# Method to remove an item from the list
# input:
# steps:
# output:

# Method to update the quantity of an item
# input:
# steps:
# output:

# Method to print a list and make it look pretty
# input:
# steps:
# output:

#===================Driver Code===================

make_list("carrots apples cereal pizza")