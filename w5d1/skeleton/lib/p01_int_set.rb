class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max)
    (0...max).each { |i| @store[i]=false }
  end


  def insert(num)
    is_valid?(num)
    store[num]= true
  end

  def remove(num)
    @store[num]= false
  end

  def include?(num)
    return true if @store[num] == true  
    false 
  end

  private

  def is_valid?(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    end
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !self[num].include?(num)
      self[num] << num
      return num
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self[num].include?(num)
      self[num] << num
      resize! if count == @store.size
      @count+=1

      return num
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count-= 1
    end
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    @store[num % num_buckets] 
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    previous_count = @count.dup
    inputed_elements = @store.dup.flatten

    @store += Array.new(@store.size){Array.new}
    @store.each do |ele|
      ele = []
    end
    inputed_elements.each do |input|
     insert(input)
    end
    @count = previous_count
    # p @store.size
  end
end
