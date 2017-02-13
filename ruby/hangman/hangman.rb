=begin
make class hangman
i'll need a method for inputting the answer to be guessed at
I'll want this to accept a string and generate both the answer attribute and a current guesses attribute
I'll want a method to count guesses and an attribute to hold guesses
When I start the game I'll also need a metric for deciding how many guesses to give
when guesses get to zero display the game lost message (check for winning first) 

to simplify things i'll create these sub-methods:
  update current state (will change current state to match answer as much as it should given the guesses)
  update guesses (updates guesses and checks that current guess hasn't been guessed yet)

guess numbers: 
  4 or fewer letters, 10 guesses
  5-6 letters, 9 guesses
  7-8 letters, 8 guesses
  9-10 letters, 7
  11 or more letters, 6 guesses
=end

class Hangman

  attr_accessor :answer, :current_state, :guesses, :letters_guessed

  def initialize
    @answer = ""
    @current_state = ""
    @guesses = 1
    @letters_guessed = []
  end

  def is_over
    if @answer == @current_state
      puts "Nice job! You win!"
      return "win"
    else
      puts "Aww, was that too hard?"
      return "loss"
    end
  end

  def update_guesses(letter)
  end

  def update_current_state()
  end

  def start_game(answer)
    #sets answer
    @answer = answer
    #sets current state
    answer.each_char do |char|
      if char != " " 
        @current_state << "-"
      else
        @current_state << " "
      end
    end
    #sets guesses
    if answer.delete(" ").length < 5
      @guesses = 10
    elsif answer.delete(" ").length < 7
      @guesses = 9
    elsif answer.delete(" ").length < 9
      @guesses = 8
    elsif answer.delete(" ").length < 11
      @guesses = 7
    else
      @guesses = 6
    end
    #refreshes letters guessed
    @letters_guessed = [] #for replayability
  end

  def guess_letter(letter)
  end

end