class LandingPageController < ApplicationController

  def index
    @game = Game.all
  end

  def show
    @game = Game.all
  end

  def open_games
    if user_signed_in?
      @open_games = Game.where(black_player_id: nil).where.not(white_player_id: current_user.id).first(5)
    end
  end
end
