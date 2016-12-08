require_relative 'piece.rb'

class Bishop < Piece
  include SlidingPiece
  def initialize(color, position, board)
    super(color, :B, position, board)
  end

  def move_dirs
    [:X]
  end

  def to_s
    "B".colorize(color)
  end
end
