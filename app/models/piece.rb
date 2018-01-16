class Piece < ApplicationRecord
  validates :game, presence: true
  belongs_to :game

  def is_obstructed?(new_x, new_y)
    horizontal_obstructed?(new_x)
    vertical_obstructed?(new_y)
    diagonal_obstructed?(new_x, new_y)
    invalid_move?(new_x, new_y)
  end

  def horizontal_obstructed?(new_x) #Horizontal movement only
    Piece.where(x_position:(self.x_position + 1..new_x),
                y_position:self.y_position).present?
  end

  def vertical_obstructed?(new_y)  #Vertical movement only
    Piece.where(y_position:(self.y_position + 1..new_y),
                x_position:self.x_position).present?
  end

  def diagonal_obstructed?(new_x, new_y)  #Diagonal movement only
    Piece.where(y_position:(self.y_position + 1..new_y),
                x_position:(self.x_position + 1..new_x)).present?
  end

  def invalid_move?(new_x, new_y) #Invalid movement (movement not horizontal, vertical, or diagonal)
    if x_position == new_x && y_position == new_y
      return true
    else
      return false
    end

    if new_x > 8 || new_y > 8
      return true
    end
  end

  def name
    self.class.to_s
  end
  
  def move_to!(new_x, new_y)
    @move_to = Piece.where(x_position: new_x, y_position: new_y, game_id: self.game_id).take
      if @move_to == nil
        Piece.update_attributes(:x_position, new_x, :y_position, new_y)
        # The piece can move to this square and update_attributes should be called
      elsif @move_to.color == self.color
        # flash message: 'This move is not allowed'
        flash[:error] = '<strong>This move is not allowed</strong>'
      else # Piece is captured
        # We have a "captured" column that should be changed to true by 
          # updating attributes and the piece should no longer be on the board
        @move_to.update_attribute(:captured, true)
        Piece.update_attributes(:x_position, new_x, :y_position, new_y)
      end
  end

end
