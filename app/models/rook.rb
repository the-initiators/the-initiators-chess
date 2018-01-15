# frozen_string_literal: true

class Rook < Piece
  
  # Rooks can move horizontally until they hit an obstruction or the edge of the board
  # Rooks can move vertically until they hit an obstruction or the edge of the board
  # Rooks cannot move diagonally or move in more than one direction in the same turn
  
  def rook_valid_move?(move_to_x, move_to_y)

  	if (self.x_position - move_to_x).abs > (8 - self.x_position).abs || 
  	   (self.y_position - move_to_y).abs > (8 - self.y_position).abs ||
  	   ((self.x_position != move_to_x) && (self.y_position != move_to_y))
  		return false
  	end
  	
  	if is_obstructed?(move_to_x, move_to_y)
  		return false
  	else
  		return true
  	end
  end


  def is_obstructed?(move_to_x, move_to_y)
  	@move_to = Piece.where(x_position: move_to_x, y_position: move_to_y, game_id: self.game_id).take
    if @move_to == nil
  		return false
  	elsif @move_to.color == self.color
  		return true
  	else #Piece is captured
      puts "Capture"
      return false
    end
  end

end