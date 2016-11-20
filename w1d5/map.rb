class Map
  def initialize
    @hash = []
  end

  def assign(key, value)
    @hash << [key, value]
  end

  def lookup(key)
    @hash.find { |entry| entry[0] == key }
  end

  def remove(key)
    @hash.delete(lookup(key))
  end

  def show
    @hash.dup
  end
end

p map = Map.new
p map.assign(:hello, 1)
p map.show
p map.assign(:helloo, 1)
p map.show
p map.assign(:hellooo, 2)
p map.show
p map.lookup(:helloo)
p map.remove(:helloo)
p map.show
