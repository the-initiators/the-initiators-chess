require 'test_helper'

describe Queen do
  let (:queen) {Queen.create(x_position: 2, y_position: 1, color: "white")}
  let (:queen2) {Queen.create(x_position: 2, y_position: 8, color: "black")}

  it "must load both queen pieces when a game is created" do
    game = Game.create_game
    assert_equal 2, Queen.where(game_id: game.id).length
  end
  
  it "must include white pieces" do
    value(queen.color).must_equal "white"
  end
  
  it "must include black pieces" do
    value(queen2.color).must_equal "black"
  end
  
end