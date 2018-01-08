# frozen_string_literal: true

class Rook < Piece
  
  # Rooks can move horizontally until they hit an obstruction or the edge of the board
  # Rooks can move vertically until they hit an obstruction or the edge of the board
  # Rooks cannot move diagonally or move in more than one direction in the same turn
  
  def rook_valid_move?(move_to_x, move_to_y)

  	if (self.x_position - move_to_x).abs > (8 - self.x_position).abs || 
  	   (self.y_position - move_to_y).abs > (8 - self.y_position).abs
  		return false
  	end
  	
  	if is_obstructed?(move_to_x, move_to_y, 1)
  		return false
  	else
  		return true
  	end
  end


  def is_obstructed?(move_to_x, move_to_y, z)
  	@move_to = Rook.where(x_position: move_to_x, y_position: move_to_y).take
    
    if @move_to == nil
  		return false
  	elsif @move_to.color == self.color
  		return true
  	elsif @move_to.color != self.color
      puts "Capture"
  	else
  		return false
    end
  end

end