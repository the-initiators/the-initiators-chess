require "test_helper"

describe Piece do
  let(:piece) { Piece.new }

  it "must be valid" do
    value(piece).must_be :valid?
  end

  it "should be be obstructed" do 
  	white_rook = FactoryBot.create(:rook)
  	white_pawn = FactoryBot.create(:pawn) 
  		
	assert white_rook.is_obstructed?(1, 3)

  end

end
