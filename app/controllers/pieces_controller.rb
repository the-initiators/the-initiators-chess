class PiecesController < ApplicationController
skip_before_action :verify_authenticity_token

  def show
    @piece = Piece.find(params[:id])
  end

  def update
    @piece = Piece.find(params[:id])
    if @piece.move_to!(piece_params[:x_position], piece_params[:y_position])

      respond_to do |format|
        format.html { redirect_to game_path(@piece.game) }
        format.json {
          render json: {success: true}, status: :ok
        }
      end
    else
      error_message = "There was an error moving the piece"
      respond_to do |format|
        format.html {  
          flash[:error] = error_message
        }
        format.json {
          render json: {error: error_message}, status: :not_acceptable
        }
      end
    end
      
  end

  def edit
    @piece = Piece.find_by_id(params[:id])
    @game = @piece.game
  end


  private

  def piece_params
    params.require(:piece).permit(:x_position, :y_position, :game_id, :color)
  end
end
