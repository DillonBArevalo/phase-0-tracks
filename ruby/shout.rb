module Shout

  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words.upcase+"!"+" :D"
  end

end




#==================Driver Code====================


puts Shout.yell_happily("yaaaaay")
puts Shout.yell_angrily("noooooooo")