require 'test_helper'

describe King do
  let (:king) {King.create(x_position: 2, y_position: 1, color: "white")}
  let (:king2) {King.create(x_position: 2, y_position: 8, color: "black")}

  it "must load both King pieces when a game is created" do
    game = Game.create_game
    assert_equal 2, King.where(game_id: game.id).length
  end
  
  it "must include white pieces" do
    value(king.color).must_equal "white"
  end
  
  it "must include black pieces" do
    value(king2.color).must_equal "black"
  end
  
end