require_relative "hangman"

describe Hangman do
  let(:game) {Hangman.new}

  it "takes a guess and creates answer and guess keys" do
    game.start_game("example")
    expect(game.answer).to eq ["example"]
    expect(game.current_state).to eq ["-------"]
  end

  it "can initialize guess numbers correctly" do
    game.start_game("ten")
    expect(game.guesses).to eq [10]
    game.start_game("nines")
    expect(game.guesses).to eq [9]
    game.start_game("eightgs")
    expect(game.guesses).to eq [8]
    game.start_game("sevenguess")
    expect(game.guesses).to eq [7]
    game.start_game("sixguessesg")
    expect(game.guesses).to eq [6]
  end

  it "can accept an answer with space(s)" do
    game.start_game("example game answer")
    expect(game.answer).to eq ["example game answer"]
    expect(game.current_state).to eq ["------- ---- ------"]
  end

  it "takes a correct guess, updates the current state, guesses and letters guessed appropriately" do
    game.start_game("example")
    game.guess_letter("e")
    expect(game.current_state).to eq ["e-----e"]
    expect(game.guesses).to eq [8]
    game.guess_letter("0")
    expect(game.current_state).to eq ["e-----e"]
    expect(game.guesses).to eq [7]
  end

  it "takes an incorrect guess, doesn't change the current state, updates guesses and letters guessed appropriately" do
    game.start_game("example")

  end



end