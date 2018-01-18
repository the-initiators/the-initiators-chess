# frozen_string_literal: true

class Queen < Piece
# The queen can be moved any number of unoccupied squares in a straight line vertically, 
# The queen can be moved any number of unoccupied squares in a straight line horizontally, 
# The queen can be moved any number of unoccupied squares in a straight line diagonally,
# queen won't be leaving the board - DON
# The queen captures by occupying the square on which an enemy piece sits.    
    
  def queen_valid_move?(move_to_x, move_to_y)
    #diagonal movement
    if ((self.x_position - move_to_x).abs == (self.y_position - move_to_y).abs)
    #horizontal movement
    elsif ((self.x_position != move_to_x) && (self.y_position == move_to_y))
    #vertical movement
    elsif ((self.y_position != move_to_y) && (self.x_position == move_to_x))
    else
      return false
    end
    
    if landing_square_obstructed?(move_to_x, move_to_y)
      return false
    else
      return true
    end
    
    
  end


  # def obstructed?(move_to_x, move_to_y)
  #   @move_to = Piece.where(x_position: move_to_x, y_position: move_to_y, game_id: self.game_id).take
  #     if @move_to == nil
  #       return false
  #     elsif @move_to.color == self.color
  #       return true
  #     else #The piece captures the original piece on the square
  #       puts "Capture"
  #       return false
  #     end
  # end
end

