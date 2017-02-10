class Santa

  attr_reader :ethnicity
  attr_accessor :gender, :age

  def initialize(gender, ethnicity)
    puts "Initializing Santa Instance ..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
    @reindeer_ranking.insert(-1, @reindeer_ranking.delete(reindeer_name))
  end

end

example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["Peruvian", "black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
random_numbers = Random.new
100000.times do |i|
  santa = Santa.new(example_genders.sample, example_ethnicities.sample)
  santa.age = rand(141)
  puts santa.gender
  puts santa.ethnicity
  puts santa.age
  #note i'm not accessing reindeer_ranking as that will always be the same unless i also write code to modify it
end




#=================Driver Code=================

=begin
jose = Santa.new

jose.speak
jose.eat_milk_and_cookies("Snicker-doodle")
=end


=begin
santas = []
santas << Santa.new("agender", "black")
santas << Santa.new("female", "Latino")
santas << Santa.new("bigender", "white")
santas << Santa.new("male", "Japanese")
santas << Santa.new("female", "prefer not to say")
santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
santas << Santa.new("N/A", "N/A")


santa = Santa.new("cis male", "Peruvian")
santa.speak
santa.eat_milk_and_cookies("Snicker-doodle")
puts santa.age
puts santa.ethnicity
puts santa.gender
puts santa.celebrate_birthday
puts santa.get_mad_at("Dasher")
=end