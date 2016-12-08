require_relative 'piece.rb'
require 'byebug'
class Pawn < Piece
  def initialize(color, position, board)
    super(color, :P, position, board)
  end

  def to_s
    "P".colorize(color)
  end

  def moves
    # byebug
    first_move = (position[0] == 6 || position[0] == 1)
    direction_changer = color == :green ? -1 : 1
    possible_moves = []

    possible_moves << [position[0] + 1 * direction_changer, position[1] ]
    possible_moves << [position[0] + 2 * direction_changer, position[1]] if first_move

    attack_right = [position[0] + 1 * direction_changer, position[1] + 1]
    attack_left = [position[0] + 1 * direction_changer, position[1] - 1]
    possible_moves << attack_left if board[attack_left].color != color
    possible_moves << attack_right if board[attack_right].color != color

    possible_moves
  end


end
