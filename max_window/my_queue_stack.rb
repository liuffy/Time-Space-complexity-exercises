
class MyQueue

  def intialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue(el)
    @store.shift(el)
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  def initialize
    @store = []
    @max = []
    @min = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store << el
    max_log(el)
    min_log(el)
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max_log(el)
    if @max.empty?
      @max << el
    elsif @max[-1] < el
      @max << el
    end
  end

  def max
    @max[-1]
  end

  def min_log(el)
    if @min.empty?
      @min << el
    elsif @min[-1] > el
      @min << el
    end
  end

  def min
    @min[-1]
  end
end

class StackQueue

  def initialize
    @in_store = MyStack.new
    @out_store =  MyStack.new
  end

  def max

  end

  def min

  end

  def enqueue(el)
    @in_store.push(el)
  end

  def dequeue
    if @out_store.empty?
      flip
    end
    @out_store.pop
  end

  def flip
    @out_store.push(@in_store.pop) until @in_store.empty?
  end

  def size
    @in_store.size + @out_store.size
  end

  def empty?
    @in_store.empty? && @out_store.empty?
  end

end
