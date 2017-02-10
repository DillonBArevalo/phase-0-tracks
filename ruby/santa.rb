class Santa
  def initialize
    puts "Initializing Santa Instance ..."
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

end





#=================Driver Code=================

jose = Santa.new

jose.speak
jose.eat_milk_and_cookies("Snicker-doodle")