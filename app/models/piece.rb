class Piece < ApplicationRecord
  belongs_to :game_params
  
  def image
    if self.color == "black"
      '&#9823;'
    else
      '&#9817;'
    end
  end
end
