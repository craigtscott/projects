require_relative 'piece.rb'

class NullPiece < Piece
  include Singleton
  attr_reader :color, :symbol

  def initialize
    @color = nil
    @symbol = nil
    @position = nil
    @board = nil
  end

  def to_s
    " "
  end
end
