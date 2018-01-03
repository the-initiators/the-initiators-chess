class Game < ApplicationRecord
    scope :available, -> { where("white_player_id IS NULL OR black_player_id IS NULL")}

end
