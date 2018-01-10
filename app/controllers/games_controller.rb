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
        @game.update_attributes(black_player_id: current_user.id)

        if game.valid? 
            game.update_attributes games_params
        end

        return redirect_to game_path(@game)
    end
end

def update_player
    if @game.black_player_id.nil?
        @game.update_attributes(black_player_id: current_user.id)
    else
        @game.update_attributes(white_player_id: current_user.id)
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


