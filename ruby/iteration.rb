def practice
  param1 = "This"
  param2 = "That"
  puts "What would you like"
  yield(param1, param2)
end

# practice { |param1, param2| puts "I want #{param1} AND #{param2}"}

arr =["carrot", "cucumber", "apple", "beef"]

h ={
  carrot: "vegetable",
  cucumber: "vegetable",
  apple: "fruit",
  beef: "meat"
}

puts "Original array:"
puts arr
puts "Original hash:"
puts h

arr.each {|food_item| puts "I like to eat #{food_item}"}

h.each {|food_item, food_type| puts "#{food_item} is #{food_type}"}

puts "Post each array:"
puts arr
puts "Post each hash:"
puts h

arr.map! do |food_item|
  if food_item != "beef" 
    food_item << "s"
  else
    food_item
  end
end

puts "Post map array"
puts arr

h.delete_if{|food_item, food_type| food_item == :beef}
puts "Post delete hash"
puts h

arr.delete_if{|food_item| food_item == "beef"}

puts "Post delete array"
puts arr