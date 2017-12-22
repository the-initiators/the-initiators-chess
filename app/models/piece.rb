class Piece < ApplicationRecord
  def is_obstructed?(new_x, new_y)  
    horizontal_obstructed?(new_x)
    vertical_obstructed?(new_y)
    diagonal_obstructed?(new_x, new_y)
  end 
  
  def horizontal_obstructed?(new_x) #Horizontal movement only
    Piece.where(x_position:(self.x_position + 1..new_x),
                y_position:self.y_position).present?
  end
  
  def vertical_obstructed?(new_y)  #Vertical movement only
    Piece.where(y_position:(self.y_position + 1..new_y), 
                x_position:self.x_position).present?
  end
  
  def diagonal_obstructed?(new_x, new_y)  #Diagonal movement only
    Piece.where(y_position:(self.y_position + 1..new_y),
                x_position:(self.x_position + 1..new_x)).present?
  end
end


