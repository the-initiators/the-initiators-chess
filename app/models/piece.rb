class Piece < ApplicationRecord
  def is_obstructed?(new_x, new_y)  
    horizontal_obstructed?(new_x)
    vertical_obstructed?(new_y)
  end 
  
  def horizontal_obstructed?(new_x) #Horizontal movement only
    Piece.where(x_position:(self.x_position + 1..new_x),
                y_position:self.y_position).present?
  end
  
  def vertical_obstructed?(new_y)  #Vertical movement only
    Piece.where(y_position:(self.y_position + 1..new_y), 
                x_position:self.x_position).present?
  end
  
  #  look to see if the spaces between the starting and ending points are open
  # define starting position (x_position and y_position of current.piece)
  # define ending position (x_position and y_position of where you want to go)
  # look to see if there is an obstruction in the way (if any pieces.present?)
  # if no obstruction
  # allow move (return false)
  # otherwise 
  # return true
  
  

end

