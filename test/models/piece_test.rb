require "test_helper"

describe Piece do
  let(:game) {Game.create_game}
  let(:piece)   { Piece.new(id: 1, game_id: 1, x_position: 1, y_position: 1, symbol: "pawn", color: "black", player_id: 1, created_at: "1/1/2016", updated_at: "1/1/2016", type: Piece, state: true, captured: false ) }
  
  it "must not be an obstructed move" do
    assert_equal false, piece.is_obstructed?(3, 1)
  end 

  it "must be a valid piece" do
    piece = Game.create_game
    value(piece).must_be :valid?
  end
  
  it "must load all pieces at game creation" do
    game = Game.create_game
    assert_equal 32, Piece.where(game_id: game.id).count
  end
  
end
