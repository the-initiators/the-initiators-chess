# frozen_string_literal: true

class Rook < Piece
  
  # Rooks can move horizontally until they hit an obstruction or the edge of the board
  # Rooks can move vertically until they hit an obstruction or the edge of the board
  # Rooks cannot move diagonally or move in more than one direction in the same turn
  
  def rook_valid_move?(move_to_x, move_to_y)
    
    # Making sure that the piece being moved will stay on the board
    if move_to_x < 1 || move_to_x > 8
      return false
    elsif move_to_y < 1 || move_to_y > 8
      return false
    end

    #horizontal movement
    if ((self.x_position != move_to_x) && (self.y_position == move_to_y))
    #vertical movement
    elsif ((self.y_position != move_to_y) && (self.x_position == move_to_x))
    #diagonal movement not allowed
    elsif ((self.x_position != move_to_x) && (self.y_position != move_to_y))
      return false
    end
    
    if is_obstructed?(move_to_x, move_to_y)
      return false
    else
      return true
    end
  end

  def is_obstructed?(move_to_x, move_to_y)
    @move_to = Piece.where(x_position: move_to_x, y_position: move_to_y, 
                           game_id: self.game_id).take
    if @move_to == nil
      return false
    elsif @move_to.color == self.color
      return true
    else #Piece is captured
      return false
    end
  end

end
