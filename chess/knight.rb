require_relative 'piece.rb'

class Knight < Piece
  include SteppingPiece
  def initialize(color, position, board)
    super(color, :N, position, board)
  end

  def to_s
    "N".colorize(color)
  end
end
