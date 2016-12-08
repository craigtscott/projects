require_relative 'piece.rb'

class King < Piece
  include SteppingPiece
  def initialize(color, position, board)
    super(color, :K, position, board)
  end

  def to_s
    "K".colorize(color)
  end
end
