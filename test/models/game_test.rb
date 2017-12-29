require "test_helper"

describe Game do
  let(:game) { Game.new }
  let(:pieces) {Game.create_game}

  it "must be valid" do
    value(game).must_be :valid?
  end
  
  it "must load the pieces to the board" do
    value(pieces).must_be :valid?
  end
end
