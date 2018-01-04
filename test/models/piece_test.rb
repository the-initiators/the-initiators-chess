require "test_helper"

describe Piece do
<<<<<<< HEAD
  let(:piece) {Piece.new(x_position: 3, y_position: 3) }
  
  it "is valid" do
    value(piece).must_be :valid?
  end
  
  it "must not be an obstructed move" do
    piece.is_obstructed?(3, 1)
    assert false
  end
end
=======
  let(:piece) { Piece.new(id: 1, x_position: 1, y_position: 1, 
                symbol: "pawn", color: "black", game_id: 1, 
                player_id: 1, created_at: "1/1/2016", 
                updated_at: "1/1/2016", type: Piece, state: true, captured: false) }
  let(:pieces) {Game.create_game}

  it "must be a valid piece" do
    piece = Game.create_game
    value(piece).must_be :valid?
  end
  
  it "must load all pieces at game creation" do
    game = Game.create_game
    assert_equal 32, Piece.where(game_id: game.id).count
  end
  
end
>>>>>>> 6e022ef603fc20319a20cb0dd71cc798835a5634
