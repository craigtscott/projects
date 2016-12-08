require_relative 'piece.rb'

class Queen < Piece
  include SlidingPiece
  def initialize(color, position, board)
    super(color, :Q, position, board)
  end

  def move_dirs
    [:X, :H]
  end

  def to_s
    "Q".colorize(color)
  end
end
