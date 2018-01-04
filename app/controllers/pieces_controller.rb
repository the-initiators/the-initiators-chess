class PiecesController < ApplicationController

	def show
		@piece = Piece.find_by_id(params[:id])
	end


	def update
		@piece = Piece.find_by_id(params[:id])
		@piece.update_attributes(piece_params)
		redirect_to game_piece_path
	end

	def edit
		@piece = Game.find_by_id(params[:id])
	end


	private

	def piece_params
		params.require(:piece).permit(:x_position, :y_position, :game_id, :color)
end
