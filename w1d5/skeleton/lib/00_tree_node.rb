class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(parent_var)
    parent.children.delete(self) unless parent.nil?
    @parent = parent_var
    parent_var.children = self unless parent_var.nil?
  end

  def children=(child)
    @children << child unless @children.include?(child)
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "not a child node" if child_node.parent.nil?
    child_node.parent = nil
  end

  def dfs(target_val)
    return self if self.value == target_val

    self.children.each do |child|
      current_node = child.dfs(target_val)
      return current_node if current_node
    end
    nil
  end

  def bfs(target_val)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_val
      queue += current_node.children
    end
    nil
  end
end
