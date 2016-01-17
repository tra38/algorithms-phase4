require_relative 'fixed_array'

class ArrayList
  attr_reader :size

  def initialize(size)
    @size = size
    @array = FixedArray.new(size * 2)
  end

  def add(element)
    resize_array if (@array.size + 1 > self.size)
    @size += 1
    @array.set(size - 1, element)
    element
  end

  def resize_array
    temp_array = FixedArray.new(size * 2 )
    size.times do |index|
      element = @array.get(index)
      temp_array.set(index, element)
    end
    @array = temp_array
  end

  def get(index)
    @array.get(index)
  end

  def set(index, element)
    @array.set(index, element)
  end

  def insert(index_to_insert, element_to_insert)
    resize_array if (@array.size + 1 > self.size)
    next_index = index_to_insert + 1
    (next_index).upto(size) do |index|
      element = @array.get(index - 1)
      @array.set(index, element)
    end
    @size += 1
    @array.set(index_to_insert, element_to_insert)
  end

end