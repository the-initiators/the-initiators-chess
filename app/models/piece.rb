class Piece < ApplicationRecord
  def is_obstructed  #Horizontal method
    starting_point = self.x_position.y_position
    final_position = # ?????????????
    
    while starting_point != final_position
      if x_position.y_position.empty?
        y_position = y_position + 1
      else 
        return false
      end
      return true
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
end

