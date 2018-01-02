class Game < ApplicationRecord
  has_many :pieces
  has_many :users
  
  def self.create_game
    game = Game.create
    8.times do |row|
      8.times do |column|
        if row < 2 
          Piece.create(x_position: column, y_position: row, game_id: game.id, color: "white")
        end
        if row > 6
          Piece.create(x_position: column, y_position: row, game_id: game.id, color: "black")
        end
      end
    end
  end
end