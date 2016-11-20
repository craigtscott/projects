class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.unshift(el)
  end

  def remove
    @stack.shift
  end

  def show
    @stack.dup
  end
end

p stack = Stack.new
p stack.show
p stack.add("1")
p stack.show
p stack.add("2")
p stack.show
p stack.remove
p stack.show
