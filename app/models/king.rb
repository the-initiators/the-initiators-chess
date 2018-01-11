# frozen_string_literal: true

class King < Piece

# DETERMINE IF MOVE IS VALID
# KING CAN MOVE 1 PLACE AT A TIME - UP, DOWN, LEFT, RIGHT
# KING CAN MOVE 1 PLACE DIAGONALLY TOO
# INVALID MOVE IF > 1 FROM CURRENT EITHER X OR Y COORD
# CHECK IF OBSTRUCTED
# OBSTRUCTED IF NEW POSITION HAVE PIECE OF SAME COLOR ON IT

def valid_move? (move_to_x, move_to_y)

  if (self.x_position - move_to_x).abs > 1 || (self.y_position - move_to_y).abs > 1
    return false
  end

  if is_obstructed?(move_to_x, move_to_y)
    return false
  else
    return true
  end

end

def is_obstructed? (move_to_x, move_to_y)

  @move_to = King.where(x_position: move_to_x, y_position: move_to_y).take

  if @move_to == nil
    return false
  end

  if @move_to.color == self.color
    return true
  elsif @move_to.color != self.color
    puts "Capture"
    return false
  else
    return false
  end
end
end
