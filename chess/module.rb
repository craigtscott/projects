
require 'byebug'

module SteppingPiece
  KNIGHT_DELTAS = [ [1, 2],
                    [2, 1],
                    [2, -1],
                    [1, -2],
                    [-1, -2],
                    [-2, -1],
                    [-2, 1],
                    [-1, 2]]
  KINGS_DELTAS = [  [1, 0],
                    [1, 1],
                    [0, 1],
                    [-1, 1],
                    [-1, 0],
                    [-1, -1],
                    [0, -1],
                    [1, -1]]

  def moves
    deltas = self.is_a?(King) ? KINGS_DELTAS : KNIGHT_DELTAS
    all_moves = deltas.map { |delta| [delta[0] + position[0], delta[1] + position[1]] }
    all_moves.select { |pos| valid_move?(pos) }
  end

  def valid_move?(pos)
    return false unless pos[0].between?(0,7) && pos[1].between?(0,7)
    if board[pos].is_a? NullPiece || board[pos].color != color
      true
    else
      false
    end
  end

end

module SlidingPiece
  DIAG_DELTAS = [ [1,1],
                [-1,1],
                [-1,-1],
                [1,-1]]
  R_C_DELTAS = [  [1,0],
                [0,1],
                [-1,0],
                [0,-1]]

  def moves
    possible_moves = []
    permisions = self.move_dirs
    possible_moves += diag_moves if permisions.include?(:X)
    possible_moves += row_col_moves if permisions.include?(:H)
    possible_moves
  end

  def diag_moves
    all_diags = []
    DIAG_DELTAS.each do |delta|
      7.times do |spacer|
        new_x = position[0] + (delta[0] * (spacer + 1))
        new_y = position[1] + (delta[1] * (spacer + 1))
        all_diags << [new_x, new_y]
      end
    end
    sanitize_moves(all_diags)
  end

  def row_col_moves
    all_row_col_moves = []
    R_C_DELTAS.each do |delta|
      7.times do |spacer|
        new_x = position[0] + (delta[0] * (spacer + 1))
        new_y = position[1] + (delta[1] * (spacer + 1))
        all_row_col_moves << [new_x, new_y]
      end
    end
    sanitize_moves(all_row_col_moves)
  end

  def sanitize_moves(all_moves)
    dir1 = all_moves[0...7]
    dir2 = all_moves[7...14]
    dir3 = all_moves[14...22]
    dir4 = all_moves[14..28]

    sanitized_moves = []
    [dir1, dir2, dir3, dir4].each do |direction|
      sanitized_moves += sanitize_direction(direction)
    end
    sanitized_moves
  end

  def sanitize_direction(moves)
    sanitized_moves = []
    moves.each_with_index do |pos, idx|
      break unless pos[0].between?(0, 7) && pos[1].between?(0, 7)
      if board[pos].color == color
        break
      elsif board[pos].is_a? NullPiece
          sanitized_moves << pos
      else
        sanitized_moves << pos
        break
      end
    end
    sanitized_moves
  end

end
