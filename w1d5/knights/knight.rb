require_relative 'Polytree'
require 'byebug'

class KnightPathFinder
  attr_accessor :root, :visited

  KNIGHTS_MOVES = [[-2,1],[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1]]

  def initialize(start_pos)
    @start_pos = start_pos
    @visited = [start_pos]
    build_move_tree
  end

  def find_path(end_pos)
    queue = [@root]
    counter = 0
    until queue.empty?
      current_node = queue.shift
      if current_node.value == end_pos
        puts "HORRAY!!! It took #{counter} node(s) to get here!"
        path_generator(current_node)
      end
      counter += 1
      queue += current_node.children
    end
    nil
  end

  def path_generator(target)
    path = [target]
    until path.last.parent.nil?
      path << path.last.parent
    end
    p path.reverse.map { |node| node.value }
  end

  def valid_moves(pos)
    potential_moves(pos).reject do |pos|
      out_of_bounds?(pos) || @visited.include?(pos)
    end
  end

  def out_of_bounds?(pos)
    # debugger
    [pos].any? { |pos_x, pos_y| pos_x < 0 || pos_x > 7 ||
                                pos_y < 0 || pos_y > 7 }
  end

  def potential_moves(pos)
    KNIGHTS_MOVES.map do |k_pos_x, k_pos_y|
      [k_pos_x + pos[0], k_pos_y + pos[1]]
    end
  end

  def build_move_tree
    @root = PolyTreeNode.new(@start_pos)
    queue = [@root]
    until queue.empty?
      current_node = queue.shift
      next_moves = valid_moves(current_node.value)
      next_nodes = next_moves.map {|pos| PolyTreeNode.new(pos)}
      next_nodes.each { |node| node.parent = current_node }
      @visited += next_moves
      queue += next_nodes
    end
  end
end
