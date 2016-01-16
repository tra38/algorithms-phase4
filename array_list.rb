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



end