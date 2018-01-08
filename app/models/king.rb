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
	if is_obstructed?(move_to_x, move_to_y, 1)
		return false
	else
		return true
	end
end

def is_obstructed? (move_to_x, move_to_y, z)

	@move_to = @game.piece.where(x_position: move_to_x, y_position: move_to_y).take

	if @move_to == nil
		return false
	if @move_to.color == self.color
		return true
	else
		return false
end

end
