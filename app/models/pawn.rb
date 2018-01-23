# frozen_string_literal: true

class Pawn < Piece
	def pawn_valid_move?(x_move, y_move)
		#if pawn is still on starting y-row, then it is allowed to move 2 spaces up (y + 2)
		if self.y_position == 2 && self.color == "white" || self.y_position == 7 && self.color == "black"
			return true if (self.y_position - y_move).abs == 2
		end

		#only allowed to move one space
		if (self.x_position - x_move).abs > 1 || (self.y_position - y_move).abs > 1
			return false
		else
			return true
		end

		#if space vertical of current position is blocked, cannot move
		#add move_to method later to check for capture opportunity
		if self.is_obstructed?(x_move, y_move)
			return true
		else
			return false
		end

	end
end
