require_relative 'fixed_array'

class ArrayList
  attr_reader :size, :length

  def initialize(size)
    @length = size * 2
    @array = FixedArray.new(@length)
    @size = 0
  end

  def add(element)
    resize_array if array_needs_resizing?
    @size += 1
    @array.set(size - 1, element)
    element
  end

  def resize_array
    temp_array = FixedArray.new(@length * 2 )
    @length.times do |index|
      element = @array.get(index)
      temp_array.set(index, element)
    end
    @length *= 2
    @array = temp_array
  end

  def get(index)
    @array.get(index)
  end

  def set(index, element)
    previous_element = @array.get(index)
    @size += 1 if previous_element == nil
    @array.set(index, element)
  end

  def insert(index_to_insert, element_to_insert)
    resize_array if array_needs_resizing?
    next_index = index_to_insert + 1
    (next_index).upto(size) do |index|
      element = @array.get(index - 1)
      @array.set(index, element)
    end
    @size += 1
    @array.set(index_to_insert, element_to_insert)
  end

  private
  def array_needs_resizing?
    (@length < @size + 1 )
  end

end