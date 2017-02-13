require_relative "hangman"

describe Hangman do
  let(:game) {Hangman.new}

  it "takes a guess and creates answer and guess keys" do
    game.start_game("example")
    expect(game.answer).to eq "example"
    expect(game.current_state).to eq "-------"
  end

  it "can initialize guess numbers correctly" do
    game.start_game("ten")
    expect(game.guesses).to eq 10
    game.start_game("nines")
    expect(game.guesses).to eq 9
    game.start_game("eightgs")
    expect(game.guesses).to eq 8
    game.start_game("sevenguess")
    expect(game.guesses).to eq 7
    game.start_game("sixguessesg")
    expect(game.guesses).to eq 6
  end

  it "can accept an answer with space(s)" do
    game.start_game("example game answer")
    expect(game.answer).to eq "example game answer"
    expect(game.current_state).to eq "------- ---- ------"
  end

  it "takes a correct guess, updates the current state, guesses and letters guessed appropriately" do
    game.start_game("example")
    game.guess_letter("e")
    expect(game.current_state).to eq "e-----e"
    expect(game.guesses).to eq 8
  end

  it "doesn't count double guesses against user" do
    game.start_game("example")
    game.guess_letter("e")
    game.guess_letter("e")
    expect(game.current_state).to eq "e-----e"
    expect(game.guesses).to eq 8
  end

  it "takes an incorrect guess, doesn't change the current state, updates guesses and letters guessed appropriately" do
    game.start_game("example")
    game.guess_letter("o")
    expect(game.current_state).to eq "-------"
    expect(game.guesses).to eq 7
  end

  it "ends the game in failure if guesses=0 and the word isn't guessed" do
    game.start_game("example")
    game.guesses = 0
    expect(game.is_over).to eq "loss"
    game.guesses = 1
    expect(game.guess_letter("o")).to eq "loss"
  end

  it "ends the game in success if the word is guessed (guesses = 0 or not)" do
    game.start_game("example")
    game.current_state = "example"
    expect(game.is_over).to eq "win"
    game.guesses = 0
    expect(game.is_over).to eq "win"
  end

end