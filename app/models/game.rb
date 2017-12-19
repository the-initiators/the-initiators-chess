class Game < ApplicationRecord
    scope :available, -> { where("open_seats > 0")}

end
