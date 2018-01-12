# frozen_string_literal: true

class Bishop < Piece

	def bishop_valid_move?(x_move, y_move)

		if (x_position - x_move).abs == (y.position - y).abs
			return true
		else
			return false
		end

		if is_obstructed?(x_move, y_move) == true
			return false
		else
			return true
		end
	end

	def is_obstructed?(x_move, y_move)
		@move_to = Bishop.where(x_position: x_move, y_position: y_move).take

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
