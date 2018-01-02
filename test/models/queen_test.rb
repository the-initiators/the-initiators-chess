require 'test_helper'

describe Queen do
  let (:queen) {Queen.create(x_position: 2, y_position: 2, color: "white")}

  it "must load both queen pieces when a game is created" do
    value(pieces).must_equal 2
  end
  
end