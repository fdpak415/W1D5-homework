class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    kv_pair = [key, value]
    if @map.include?(kv_pair)
      @map.each do |arr|
        arr[-1] = value if arr.first == key
      end
    else
      @map << kv_pair
    end
  end

  def lookup(key)
    @map.each do |arr|
      return arr.last if arr.first == key
    end
  end

  def remove(key)
    @map.reject! {|arr| arr[0] == key}
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
  end
end
