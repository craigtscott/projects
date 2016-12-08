require_relative "module.rb"
require 'singleton'

class Piece
  attr_reader :color, :symbol, :board
  attr_accessor :position
  def initialize(color, symbol, position, board)
    @color = color
    @symbol = symbol
    @position = position
    @board = board
  end


end
