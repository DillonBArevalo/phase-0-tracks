=begin
module Shout

  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words.upcase+"!"+" :D"
  end

end

=end

module Shout

  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yell_happily(words)
    words.upcase+"!"+" :D"
  end

end

class Pirate
  include Shout
end

class Jerk
  include Shout
end

#==================Driver Code====================


#puts Shout.yell_happily("yaaaaay")
#puts Shout.yell_angrily("noooooooo")

blackbeard = Pirate.new
hurk = Jerk.new

puts blackbeard.yell_happily("Yaaarrrrrr, Land Ho!")
puts blackbeard.yell_angrily("Avast, we be taking enemy fire!")
puts hurk.yell_angrily("Hey weakling! Get over here!")
puts hurk.yell_happily("Yaaay! Candy!")