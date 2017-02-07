class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(int)
    int.times {|num| puts "Woof!"}
  end

  def roll_over
    puts "Rolls over"
  end

  def dog_years(int)
    int*7 #should implicitly return this
  end

  def play_dead
    puts "Plays dead (awwwww)"
  end

  def initialize
    puts "Initializing new puppy instance ..."
  end

end

frank = Puppy.new

frank.fetch("ball")
frank.speak(5)
frank.roll_over
frank.play_dead

class Cat

  def initialize
    puts "Initializing new cat instance..."
  end

  def purr
    puts "purrs"
  end

  def hiss
    puts "hisses"
  end

end

cat_list = Array.new

