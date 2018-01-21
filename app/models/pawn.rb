# frozen_string_literal: true

class Pawn < Piece
	def pawn_valid_move?(x_move, y_move)
		#only allowed to move one space
		if (self.x_position - x_move).abs > 1 || (self.y_position - y_move).abs > 1
			return false
		else
			return true
		end

		#if space vertical of current position is blocked, cannot move
		if vertical_obstructed? == true
			return true
		end
	end

	private

	def move_two?
		if y_position.any? == 2 || y_position.any? == 7
			return true
		else
			return false
		end
	end
end
