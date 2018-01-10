class LandingPageController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @game = Game.all
  end

  def show
    @game = Game.all
  end

end
