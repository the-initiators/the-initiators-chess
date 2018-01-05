# frozen_string_literal: true

class Rook < Piece
  def rook_valid_move(new_x, new_y)
    # Rooks can move horizontally until they hit an obstruction or the edge of the board
    # Rooks can move vertically until they hit an obstruction or the edge of the board
    # Rooks cannot move diagonally or move in more than one direction in the same turn
    if is_obstructed?(new_x, new_y) == false
      return "Invalid move, piece is obstructed"
    else
      return new_x
    end
  end
  
  
  
  
  
  
  
  
  
# # The rook moves horizontally or vertically, through any number of unoccupied squares 
#   def rook_valid_move(new_x, new_y)
#     if is_obstructed?(new_x, new_y)
#       return "Invalid move"
#     elsif Piece.where(x_position:new_x, 
#                   y_position:self.y_position, color:!self.color).present?
#       puts "Capture"
#     elsif Piece.where(x_position:self.x_position, 
#                       y_position:new_y, color:!self.color).present?
#       puts "Capture"
#     elsif Piece.where(x_position:new_x, y_position:self.y_position)
#       self.x_position = new_x
#     elsif Piece.where(x_position:self.x_position, y_position:new_y)
#       self.y_position = new_y
#     end
#   end
  
end
