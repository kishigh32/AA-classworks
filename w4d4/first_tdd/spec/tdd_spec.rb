require 'rspec'
require 'tdd'

describe Array do
  describe '#my_uniq' do
    subject(:start_arr) { [4, 5, 6, 6, 7, 5, 8] }

    it 'it should take in an array' do
      expect{start_arr.my_uniq}.to_not raise_error
    end

    it 'it should return an array without duplicates' do
      expect(start_arr.my_uniq).to eq([4, 5, 6, 7, 8])
    end

    it 'it should not mutate the original array' do
      start_arr.my_uniq
      expect(start_arr).to eq([4, 5, 6, 6, 7, 5, 8])
    end
  end

  describe '#two_sum' do
    let (:arr) { [-2, 1, 2, 0, -3, 3] }

    it 'it should take in an array' do
      expect{arr.two_sum}.to_not raise_error
    end

    it 'it should an array of indices where their sum is zero' do 
      expect(arr.two_sum).to eq([[0, 2], [4, 5]])
    end

    it 'it should not return same indices as a pair' do
      expect(arr.two_sum).to_not include([3,3])
    end
  end

end

describe '#my_transpose' do
  let (:matrix) { 
    [[1, 1, 1],
    [2, 2, 2],
    [3, 3, 3]]
  }

  it 'it should take an array as an argument' do 
    expect{my_transpose(matrix)}.to_not raise_error
  end

  it 'it should not call Array#transpose' do
    expect(matrix).to_not receive(:transpose)
    my_transpose(matrix)
  end

  it 'it should not mutate the original array' do
    expect(my_transpose(matrix)).to_not eq(matrix)
  end

  it 'it returns the same array where row and column indices are switched' do
    expect(my_transpose(matrix)).to eq(matrix.transpose)
  end
end

describe '#stock_picker' do
  let (:prices) { [100, 111, 169, 147, 121, 200, 21, 180, 197, 87] }

  it 'it should take an array as an argument' do 
    expect{stock_picker(prices)}.to_not raise_error
  end

  it 'it should return a pair of indices' do
    expect(stock_picker(prices).length).to eq(2)
  end

  it 'return the days (indices) that would be the most profitable to buy/sell on' do
    expect(stock_picker(prices)).to eq([6, 8])
  end
end

