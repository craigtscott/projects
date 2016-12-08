require_relative "king.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "knight.rb"
require_relative "nullpiece.rb"
require_relative "pawn.rb"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate
  end

  def populate
    @grid.each_with_index do |row, row_num|
      row.each_index do |col|
        if row_num == 0 || row_num == 7
          all_the_kings_men(row_num)
        elsif row_num == 1 || row_num == 6
          minions_assemble(row_num)
        else
          @grid[row_num][col] = NullPiece.instance
        end
      end
    end
  end

  def minions_assemble(row_num)
    color = (row_num == 1 ? :magenta : :green)
    8.times do |col|
      pos = [row_num, col]
      self[pos] = Pawn.new(color, pos, self)
    end
  end

  def all_the_kings_men(row_num)
    color = (row_num == 0 ? :magenta : :green)
    8.times do |col|
      pos = [row_num, col]
      case col
      when 0, 7
        self[pos] = Rook.new(color, pos, self)
      when 1, 6
        self[pos] = Knight.new(color, pos, self)
      when 2, 5
        self[pos] = Bishop.new(color, pos, self)
      when 3
        self[pos] = Queen.new(color, pos, self)
      when 4
        self[pos] = King.new(color, pos, self)
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def in_bounds?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  def move_piece(start_pos, end_pos)
    current_piece = self[start_pos]
    raise "No piece to move." if current_piece.is_a? NullPiece
    raise "Piece cannot move there." unless current_piece.moves.include?(end_pos)
    self[end_pos] = current_piece
    current_piece.position = end_pos
    self[start_pos] = NullPiece.instance
  end
end
