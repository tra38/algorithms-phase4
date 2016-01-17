require_relative 'fixed_array'

class ArrayList
  attr_reader :size

  def initialize(size)
    @size = size
    @array = FixedArray.new(size)
  end

  def add(element)
    create_new_array(size)
    @size += 1
    @array.set(size, element)
    element
  end

  def create_new_array(size)
    temp_array = FixedArray.new(size + 1)
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
    temp_array = FixedArray.new(size + 1)
    0.upto(index_to_insert - 1) do |index|
      element = @array.get(index)
      temp_array.set(index, element)
    end
    temp_array.set(index_to_insert, element_to_insert)
    current_index = index_to_insert + 1
    (current_index).upto(size) do |index|
      element = @array.get(index - 1)
      temp_array.set(index, element)
    end
    @array = temp_array
    @size += 1
    element_to_insert
  end

end