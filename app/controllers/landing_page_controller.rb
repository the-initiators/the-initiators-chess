class LandingPageController < ApplicationController
  before_action :authenticate_user!
  def index
    @open_games = open_games
  end

  def show
    @open_games = open_games
  end


  def open_games   
    if user_signed_in?
     @open_games = Game.where(black_player_id: nil).where.not(white_player_id: current_user.id).first(5) 
    end
  end  
end
