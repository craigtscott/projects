require_relative 'piece.rb'

class Rook < Piece
  include SlidingPiece
  def initialize(color, position, board)
    super(color, :R, position, board)
  end

  def move_dirs
    [:H]
  end

  def to_s
    "R".colorize(color)
  end
end
