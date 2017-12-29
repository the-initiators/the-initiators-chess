class Game < ApplicationRecord
  has_many :pieces
  has_many :users
  
  def self.create_game
  game = Game.create
    8.times do |r|
      8.times do |c|
        if r == 2
          Piece.create(x_position: c, y_position: r, game_id: game.id, color: "black")
        end
        if r == 7
          Piece.create(x_position: c, y_position: r, game_id: game.id, color: "white")
        end
      end
    end
    game
  end
end