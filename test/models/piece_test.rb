require "test_helper"

describe Piece do
  let(:game) {Game.create_game}
  let(:piece) { Piece.create(id: 1, game_id: 1, x_position: 1, y_position: 2, 
                symbol: "pawn", color: "black", player_id: 1, created_at: 
                "1/1/2016", updated_at: "1/1/2016", type: Piece, state: true, 
                captured: false ) }
  

  it "must not be an obstructed move" do
    assert_equal false, piece.is_obstructed?(3, 1)
  end 

  it "must be a valid piece" do
    value(game).must_be :valid?
  end
  
  it "must load all pieces at game creation" do
    assert_equal 32, Piece.where(game_id: game.id).count
  end
  
  it 'must not allow a piece to move off the board vertically' do
    assert_equal true, piece.invalid_move?(3, 9)
  end
  
  it 'must not allow a piece to move off the board horizontally' do
    assert_equal true, piece.invalid_move?(0, 5)
  end
  
  it 'must allow a piece to land on an empty position' do
    assert_equal true, piece.landing_square_available?(1, 4)
  end
  
  it 'must not allow piece to move to square with piece of same color' do
    assert_equal true, piece.landing_square_available?(2, 2)
  end
  
  it 'must allow for capture of piece of different color' do
    assert_equal true, piece.landing_square_available?(1, 6)
  end
  
  it 'must move piece to new location if empty' do
    
  end
  
  it 'must not move to a square with a piece of the same color' do
    
  end
  
  it 'must capture piece of opposite color when moving into new location' do
    
  end
  
end
