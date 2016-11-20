class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end
end

p queue = Queue.new
p queue.show
p queue.enqueue("1")
p queue.show
p queue.enqueue("2")
p queue.show
p queue.dequeue
p queue.show
