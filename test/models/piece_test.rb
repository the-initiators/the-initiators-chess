require "test_helper"

describe Piece do
  let(:piece) { Piece.new(id: "1", x_position: "1", y_position: "1", 
                symbol: "pawn", color: "black", game_id: "1", 
                player_id: "1", created_at: "1/1/2016", 
                updated_at: "1/1/2016", type: Piece, state: true, captured: false) }
  let(:pieces) {Game.create_game}

  it "must be valid" do
    value(piece).must_be :valid?
  end
  
  it "must load all pieces at game creation" do
    value(pieces).must_equal 32
  end
  
end
