require 'test_helper'

describe Bishop do
    
  let (:rook) {Rook.create(x_position: 3, y_position: 1, color: "white")}
  let (:rook2) {Rook.create(x_position: 6, y_position: 1, color: "white")}
  let (:rook3) {Rook.create(x_position: 3, y_position: 8, color: "black")}
  let (:rook4) {Rook.create(x_position: 6, y_position: 8, color: "black")}

  it "must load both Rook pieces when a game is created" do
    game = Game.create_game
    assert_equal 4, Rook.where(game_id: game.id).length
  end
  
  it "must include white pieces" do
    value(rook.color).must_equal "white"
  end
  
  it "must include black pieces" do
    value(rook4.color).must_equal "black"
  end
  
end