class Piece < ApplicationRecord
  def is_obstructed?  #Horizontal method
    self.each_with_index do |location, x|
      if location == current.x_position.y_position
        location = (x_position + 1).y_position
        while location = x_position.y_position.empty?
          location = (x_position + 1).y_position
          return true
        end
        return false
      end
    end
  end 
  
  #  look to see if the spaces between the starting and ending points are open
  # define starting position (x_position and y_position of current.piece)
  # define ending position (x_position and y_position of where you want to go)
  # look to see if there is an obstruction in the way (if any pieces.present?)
  # if no obstruction
  # allow move (return false)
  # otherwise 
  # return true
  
  

end

