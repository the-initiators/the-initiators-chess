require "test_helper"

class PieceTest < Minitest::Test

  def test_that_it_has_a_Piece
    refute_nil ::ApplicationRecord::Piece
  end 

  def test_is_obstructed_method_works
    piece = FactoryBot.create(:piece)
    assert piece.is_obstructed?(3, 3).must_equal false
  end 
  
end