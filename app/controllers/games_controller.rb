class GamesController < ApplicationController


    def new
        @game = Game.new
    end


    def create
        @game = Game.create(game_params)
        redirect_to game_path(@game)
    end

    def show
        @game = Game.find(params[:id])
    end
    

    

    def update
        @game = Game.find(params[:id])
        if game.valid? && unique_players?
            game.update_attributes games_params


        end

        return redirect_to game_path(@game)
    end

end




private


def current_game
    @current_game  ||= Game.find(params[:id])
end

def game
    @game ||= Game.where(id: params[:id]).last
end

def game_params
    params.require(:game).permit(:game_name, :white_player_id, :black_player_id)
end

def unique_players?
    @game.white_player_id != game_params[:black_player_id].to_i
end
