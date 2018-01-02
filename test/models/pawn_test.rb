require 'test_helper'

describe Pawn do
  let (:pawn) {Pawn.create(x_position: 1, y_position: 2, color: "white")}
  
  it "must load all pawns when a game is created" do
    value(pawn).must_equal 16
  end
end