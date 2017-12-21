require "test_helper"

class PieceTest < Minitest::Test

	test "should check for obstruction" do 
		@piece = FactoryBot.build(:piece, :x_position => 1, :y_position => 1)
		assert piece.is_obstructed?(2, 1)
	end
end


  
    

# test "should not be horizontal obstructed" do 
#     @piece = Piece.new
#   	assert_not_nil piece.is_obstructed?(3, 1)

#   end

# @white_rook = FactoryBot.build(:rook)
   #  @white_knight = FactoryBot.build(:knight)

   #  @white_rook = Rook.new
   #  @white_knight = Knight.new

# describe Piece do
#   let(:piece) { Piece.new }

#   it "must be valid" do
#     value(piece).must_be :valid?
#   end
# end


#   test "should be be obstructed" do 
#   	white_rook = FactoryBot.create(:rook)
#   	white_pawn = FactoryBot.create(:pawn) 
  		
# 	 assert white_rook.is_obstructed?(1, 3)

#   end
