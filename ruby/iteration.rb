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
  beef: "protein"
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

h.keep_if{|food_item, food_type| food_type == "vegetable"}
puts "Post keep hash"
puts h

arr.keep_if{|food_item| food_item[0] == "c"}

puts "Post keep array"
puts arr

arr << "apple"
arr << "beef"

h[:apple] = "fruit"
h[:beef] = "protein"

arr = arr.select {|food_item| food_item[0]=="c"}

puts "Post select array (after repopulation)"
puts arr

h = h.select {|food_item, food_type| food_type=="vegetable"}

puts "Post select hash (after repopulation)"
puts h

arr = arr.drop_while {|food_item| food_item.length<8}
puts "Post drop array"
puts arr

h[:apple] = "fruit"
h[:beef] = "protein"

puts "Repopulated hash:"
puts h

var=true

h.delete_if do |food_item, food_type|
  if food_type != "vegetable"
    var=false
  end
  var
end

puts "Final hash:"
puts h

#I know we already used delete if, but there wasn't an easy option for hash for this challenge so this is what I thought of