require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def board=(val)
    @board = val
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_pos = []
    3.times do |row_idx|
      3.times do |col_idx|
        possible_pos << TicTacToe.new(@board, [row_idx, col_idx]) if @board.rows[row_idx][col_idx].nil?
      end
    end
    possible_pos
  end
end

# Array.new(3) { Array.new(3) }
