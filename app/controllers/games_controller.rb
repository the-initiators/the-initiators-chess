class GamesController < ApplicationController
    before_action :authenticate_users!
    helper_method :game

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

    def index
        redirect_to root_path
    end

    def update
        if game.valid? && unique_users?
            game.update_attributes games_params
        end

        return redirect_to game_path game
    end
    render :new, status: :unprocessable_entity
end




private

def game
    @game ||= Game.where(id: params[:id]).last
end

def game_params
    params.require(:game).permit(:game_name, :white_player_id, :black_player_id)
end

