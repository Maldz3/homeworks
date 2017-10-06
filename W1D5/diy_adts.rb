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
