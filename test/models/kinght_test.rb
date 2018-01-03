require 'test_helper'

describe Knight do
    
  let (:knight) {Knight.create(x_position: 3, y_position: 1, color: "white")}
  let (:knight2) {Knight.create(x_position: 6, y_position: 1, color: "white")}
  let (:knight3) {Knight.create(x_position: 3, y_position: 8, color: "black")}
  let (:knight4) {Knight.create(x_position: 6, y_position: 8, color: "black")}

  it "must load both Knight pieces when a game is created" do
    game = Game.create_game
    assert_equal 4, Knight.where(game_id: game.id).length
  end
  
  it "must include white pieces" do
    value(knight.color).must_equal "white"
  end
  
  it "must include black pieces" do
    value(knight4.color).must_equal "black"
  end
  
end