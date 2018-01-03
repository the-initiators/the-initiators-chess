class GamesController < ApplicationController

    def new
        @game = Game.new
    end


    def create
        @game = Game.create(game_params)
        redirect_to game_path(@game)
    end


    def show
        unless game.present?
            return redirect_to root_path
        end
    end

    def update
        if game.valid?
            game.update_attributes games_params
        end

        return redirect_to game_path game
    end




    private

    def game
        @game ||= Game.where(id: params[:id]).all
    end

    def game_params
        params.require(:game).permit(:game_name, :white_player_id, :black_player_id)
    end
end
