require 'test_helper'
require 'support/factory_bot'

describe Rook do
    
  let (:rook) {Rook.create(x_position: 3, y_position: 1, color: "white")}
  let (:rook2) {Rook.create(x_position: 6, y_position: 1, color: "white")}
  let (:rook3) {Rook.create(x_position: 3, y_position: 8, color: "black")}
  let (:rook4) {Rook.create(x_position: 6, y_position: 8, color: "black")}

  it "must load all Rook pieces when a game is created" do
    game = Game.create_game
    assert_equal 4, Rook.where(game_id: game.id).length
  end

  it 'must include white pieces' do
    assert_equal 'white', rook.color
  end

  it 'must include black pieces' do
    assert_equal 'black', rook4.color
  end

  it 'must allow horizontal movements' do
    Factory.create(:rook)
    assert_equal true, rook3.rook_valid_move?(1, 8)
  end
  
  it 'must not allow horizontal movements' do
    assert_equal false, rook3.rook_valid_move?(9, 8)
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
  
end