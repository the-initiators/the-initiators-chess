require 'test_helper'

describe Pawn do
  let (:pawn) {Pawn.create(x_position: 1, y_position: 2, color: "white", game_id: 2)}
  let (:pawn2) {Pawn.create(x_position: 1, y_position: 7, color: "black", game_id: 2)}
  
  it "must load all pawns when a game is created" do
    game = Game.create_game
    assert_equal 16, Pawn.where(game_id: game.id).count
  end
  
  it "must include white peices" do
    assert_equal "white", pawn.color
  end
  
  it "must include black pieces" do
    assert_equal "black", pawn2.color
  end
end