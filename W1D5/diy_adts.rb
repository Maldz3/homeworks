class Stack
    attr_reader :stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def add(el)
      # adds an element to the stack
      @stack.push(el)
      el
    end

    def remove
      # removes one element from the stack
      @stack.pop
    end

    def show
      # return a copy of the stack
      @stack
    end
  end

  stack_1 = Stack.new
  p stack_1.add(3)

class Queue
  attr_reader :queue

  def initialize
    # create ivar to store stack here!
    @queue = []
  end

  def enqueue(el)
    # adds an element to the stack
    @stack.unshift(el)
    el
  end

  def dequeue
    # removes one element from the stack
    @stack.pop
  end

  def show
    # return a copy of the stack
    @queue
  end
end


class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    get_index = nil
    @map.each { |pair| get_index = @map.index(pair) if pair[0] == key }
    get_index ? @map[get_index][1] = value : @map << [key, value]
    [key, valuemy]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
    puts "That key is not in the map"
  end

  def remove(key)
    get_index = nil
    @map.each { |pair| get_index = @map.index(pair) if pair[0] == key}
    @map.delete_at(get_index) if get_index
    @map
  end

  def show
    @map
  end

end
