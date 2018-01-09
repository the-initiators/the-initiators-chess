class Piece < ApplicationRecord
  belongs_to :game

  def is_obstructed?(new_x, new_y)  
    horizontal_obstructed?(new_x)
    vertical_obstructed?(new_y)
    diagonal_obstructed?(new_x, new_y)
    invalid_move?(new_x, new_y)
  end 
  
  def horizontal_obstructed?(new_x) #Horizontal movement only
    Piece.where(x_position:(self.x_position - 1..new_x),
                y_position:self.y_position).present? && 
    Piece.where(x_position:(self.x_position + 1..new_x),
                y_position:self.y_position).present?
  end
  
  def vertical_obstructed?(new_y)  #Vertical movement only
    Piece.where(y_position:(self.y_position - 1..new_y), 
                x_position:self.x_position).present? &&
    Piece.where(y_position:(self.y_position + 1..new_y),
                x_position:self.x_position).present?
  end
  

  def diagonal_obstructed?(new_x, new_y)  #Diagonal movement only
    Piece.where(y_position:(self.y_position - 1..new_y),
                x_position:(self.x_position - 1..new_x)).present? &&
    Piece.where(y_position:(self.y_position + 1..new_y),
                x_position:(self.x_position + 1..new_x)).present?
  end


  def invalid_move?(new_x, new_y) #Invalid movement (movement not horizontal, vertical, or diagonal)
    if x_position == new_x && y_position == new_y
      return true
    else
      return false
    end

    if new_x > 8 || new_y > 8
      return true
    end
  end
end

  