require 'test_helper'

describe Rook do
    
  let (:rook) {Rook.create(x_position: 3, y_position: 1, color: "white")}
  let (:rook2) {Rook.create(x_position: 6, y_position: 1, color: "white")}
  let (:rook3) {Rook.create(x_position: 3, y_position: 8, color: "black")}
  let (:rook4) {Rook.create(x_position: 6, y_position: 8, color: "black")}

  it "must load both Rook pieces when a game is created" do
    game = Game.create_game
    assert_equal 4, Rook.where(game_id: game.id).length
  end
  
  it "must include white pieces" do
    assert_equal "white", rook.color
    # value(rook.color).must_equal "white"
  end
  
  it "must include black pieces" do
    assert_equal "black", rook4.color
    # value(rook4.color).must_equal "black"
  end
  
  it "must allow horizontal movements" do
    Rook.create(x_position:4, y_position:8)
    assert_equal 6, rook3.rook_valid_move(6, 8)
  end
  
  # it "must allow vertical movements" do
  #   assert_equal 4, rook.valid_move(6, 4)
  # end
  
  # it "must not allow vertical movements" do
    
  # end
  
  # it "must not allow movement in two directions in a turn" do
  #   
  # end
  
end