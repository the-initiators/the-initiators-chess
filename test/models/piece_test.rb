require "test_helper"

describe Piece do
  let(:piece) {Piece.new(x_position: 3, y_position: 3) }
  
  it "is valid" do
    value(piece).must_be :valid?
  end
  
  it "must not be an obstructed move" do
    piece.is_obstructed?(3, 1)
    assert false
  end
end