# Virus Predictor

# I worked on this challenge by myself.
# I [We] spent 1 hour on this challenge.

# EXPLANATION OF require_relative
#require_relative includes another file in this file. thus, I can access the STATE_DATA hash that is in the state data file.
#It's particularly useful in letting your programs and files stay focused and specific and can allow you to use data sets like state data across multiple files without having to copy paste it.
#require_relative is different from require in that it only needs a relative path to find the file. as state data is in the same directory as my_solution, we just have to say state data, instead of a full location
require_relative 'state_data'

class VirusPredictor

  # this method initializes an instance of the VirusPredictor class
  # it inputs the data from the STATE_DATA hash (upon the values being entered) and saves them to attributes
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density #note that this isn't used anymore once in inputted the scalar functionality. i kept it in just in case it will be wanted in future updates of this project?
    @population_density_scalar = (population_density/50).floor
    if @population_density_scalar > 4
      @population_density_scalar = 4
    end
  end

  #This runs both predicted_deaths and speed_of_spread with all the relevant variables to a specific instance
  #these both print information about the virus and its effects
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  #this tag makes the following methods non accessible outside of their use in the constructed methods of this class (you can't call instance.private_method)
  #this is useful when you want to have methods used only as parts of another method in the class.
  private

  #predicted deaths calculates how many deaths will happen in a state based off its population
  #there is a predetermined function that was simply plugged in here with an if statement. 
  #it then prints the result with interpolation into a nice, clean statement.
  #note: it takes but never uses a its parameters.
  #the floor method is one we haven't strictly seen before but it rounds the number it is applied to down to the nearest int.
  def predicted_deaths
    # predicted deaths is solely based on population density
    number_of_deaths = (@population * (@population_density_scalar/10.0)).floor
    if number_of_deaths == 0
      number_of_deaths = (@population * 0.05).floor
    end
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  #This method does a very similar thing to the predicted deaths method.
  #It takes population density and the state in question (though, as in the previous method, it never uses the state parameter or any others)
  #and uses a pre-defined formula (that is implemented with an if/else statement) to print out the speed the virus will spread
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 2.5 - @population_density_scalar/2.0

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

#this belongs out here in driver code as it's only using the methods of the class and it needs inputted data.
STATE_DATA.each do |state_key, population_data|
  state = VirusPredictor.new(state_key, population_data[:population_density], population_data[:population])
  state.virus_effects
end


=begin
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects
=end

#=======================================================================
# Reflection Section
=begin
What are the differences between the two different hash syntaxes shown in the state_data file?

  The first one is expanded and much easier to read if it's a large hash. it also uses hash rockets to declare its keys and values instead of the symbol: value style.

What does require_relative do? How is it different from require?

  see answer above (in comments above require relative. i think you're supposed to put this in your own words instead of the group's words but i worked by myself, so it'd be exactly the same)

What are some ways to iterate through a hash?

  for hashes there are many versions of .each. there is the .each that takes both the key and the value, there's each_key (which only uses the keys), each_pair (which is the same as each), and each_value (which iterates through the values with a block).

When refactoring virus_effects, what stood out to you about the variables, if anything?

  the variables were all attributes, which can be accessed in any instance methods anyway and thus passing them was entirely irrelevant.

What concept did you most solidify in this challenge?

  the thing most solidified for me was if I'm ever writing code that anyone else may ever want to look at/use comments are super important.


=end