require 'test_helper'

describe Rook do
    
  let (:rook) {Rook.create(x_position: 3, y_position: 1, color: "white", game_id: game.id)}
  let (:rook2) {Rook.create(x_position: 6, y_position: 1, color: "white", game_id: game.id)}
  let (:rook3) {Rook.create(x_position: 3, y_position: 5, color: "black", game_id: game.id)}
  let (:rook4) {Rook.create(x_position: 6, y_position: 8, color: "black", game_id: game.id)}
  let (:game) {Game.create_game}

  it "must load all Rook pieces when a game is created" do
    assert_equal 4, Rook.where(game_id: game.id).length
  end

  it 'must include white pieces' do
    assert_equal 'white', rook.color
  end

  it 'must include black pieces' do
    assert_equal 'black', rook4.color
  end

  it 'must allow horizontal movements' do
    assert_equal true, rook3.rook_valid_move?(4, 5)
  end
  
  it 'must not allow horizontal movements' do
    assert_equal false, rook3.rook_valid_move?(9, 5)
  end
  
  it 'must allow vertical movements' do
    assert_equal true, rook.rook_valid_move?(3, 8)
  end
  
  it 'must not allow vertical movements' do
    assert_equal false, rook.rook_valid_move?(3, 9)
  end
  
  it 'must not allow movement in two directions in the same turn' do
    assert_equal false, rook.rook_valid_move?(4, 6)
  end
  
  it 'must not allow a piece to move off the board vertically' do
    assert_equal false, rook.rook_valid_move?(3, 9)
  end
  
  it 'must not allow a piece to move off the board horizontally' do
    assert_equal false, rook.rook_valid_move?(0, 5)
  end
  
  it 'must allow a piece to land on an empty position' do
    assert_equal false, rook.is_obstructed?(5, 5)
  end
  
  it 'must not allow rook to move to square with piece of same color' do
    assert_equal true, rook.is_obstructed?(2, 1)
  end
  
  it 'must allow for capture of piece of different color' do
    assert_equal false, rook.is_obstructed?(3, 6)
  end
  
  it 'must allow rook_is_valid? to return true' do
    assert_equal true, rook.rook_valid_move?(3, 5)
  end
  
  it 'must not allow rook_is_valid? to return true when move is obstructed' do
    assert_equal false, rook.rook_valid_move?(2, 2)
  end
end
