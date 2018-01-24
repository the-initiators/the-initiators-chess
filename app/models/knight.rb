# frozen_string_literal: true

class Knight < Piece
# DETERMINE IF MOVE IS VALID
# KNIGHT CAN MOVE TO 8 PLACES
# EACH PLACE A HORIZONTAL OR VERTICLE L FROM CURRENT POSITION
# CHECK IF OBSTRUCTED
# OBSTRUCTED IF NEW POSITION HAVE PIECE OF SAME COLOR ON IT

def valid_move?(move_to_x, move_to_y)
  if (self.x_position - move_to_x).abs === 1 && (self.y_position - move_to_y).abs === 2
    return true
  elsif (self.x_position - move_to_x).abs === 2 && (self.y_position - move_to_y).abs === 1
    return true
  else
    return false
  end

  if obstructed?(move_to_x, move_to_y)
    return false
    end
  end

def obstructed?(move_to_x, move_to_y)
  @move_to = Piece.where(x_position: move_to_x, y_position: move_to_y).take

  if @move_to == nil
    return false
  end

  if @move_to.color == self.color
    return true
  elsif @move_to.color != self.color
    puts 'Capture'
    return false
  else
    return false
  end
end
end
