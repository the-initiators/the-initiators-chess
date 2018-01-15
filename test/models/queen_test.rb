require 'test_helper'

describe Queen do
  let (:queen) {Queen.create(x_position: 3, y_position: 3, color: "white")}
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
  
  it 'must allow horizontal movements' do
    assert_equal true, queen2.queen_valid_move?(3, 8)
  end
  
  it 'must not allow horizontal movements' do
    assert_equal false, queen2.queen_valid_move?(9, 8)
  end
  
  it 'must allow vertical movements' do
    assert_equal true, queen.queen_valid_move?(3, 5)
  end
  
  it 'must not allow vertical movements' do
    assert_equal false, queen2.queen_valid_move?(2, 9)
  end
  
  it 'must not allow non-diagonal movement in the x and y directions in the same turn' do
    assert_equal false, queen2.queen_valid_move?(3, 5)
  end
  
  it 'must allow diagonal moves' do
    assert_equal true, queen.queen_valid_move?(5, 5)
  end
  
  it 'must not allow a piece to move off the board vertically' do
    assert_equal false, queen.queen_valid_move?(3, 9)
  end
  
  it 'must not allow a piece to move off the board horizontally' do
    assert_equal false, queen.queen_valid_move?(0, 5)
  end
  
  it 'must allow a piece to land on an empty position' do
    assert_equal false, queen.queen_is_obstructed?(5, 5)
  end
  
  it 'must not allow queen to move to square with piece of same color' do
    assert_equal true, queen.queen_is_obstructed?(2, 2)
  end
  
  

end