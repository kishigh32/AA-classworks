class Array
  def my_uniq
    uniq_arr = []
    self.each do |ele|
      uniq_arr << ele if !uniq_arr.include?(ele)
    end
    return uniq_arr
  end

  def two_sum
    sum_arr = []
    (0...self.length).each do |i|
      (i...self.length).each do |j|
        sum_arr << [i,j] if self[i] + self[j] == 0 && i != j
      end
    end
    sum_arr
  end
end

def my_transpose(arr)
  transposed = Array.new(arr.length) { Array.new(arr.length) }
  arr.each_with_index do |e1, i1|
    arr.each_with_index do |e2, i2|
      transposed[i1][i2] = arr[i2][i1]
    end
  end
  return transposed
end

def stock_picker(arr)
  diff = 0
  best = []

  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      if i != j && arr[j] >= arr[i] && (arr[j] - arr[i]) >= diff
        diff = arr[j] - arr[i]
        best = [i, j]
      end
    end
  end
  
  return best
end