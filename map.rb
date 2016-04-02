require_relative 'array_list'

class Map
  attr_reader :keys, :values
  attr_accessor :next_index

  def initialize
    @keys = ArrayList.new(5)
    @values = ArrayList.new(5)
  end

  def set(key, value)
    key_index = find_key_index(key)
    if key_index
      values.set(key_index, value)
    else
      keys.add(key)
      values.add(value)
    end
  end

  def get(key)
    key_index = find_key_index(key)
    if key_index
      values.get(key_index)
    else
      nil
    end
  end

  def remove(key)
    key_index = find_key_index(key)
    if key_index
      keys.set(key_index, nil)
      values.set(key_index, nil)
    end
  end

  def has_key?(key)
    find_key_index(key) ? true : false
  end

  def iterate
    loop_through_keys do |index|
      key = @keys.get(index)
      if key
        value = @values.get(index)
        yield(value, key)
      end
    end
  end

  private

  def find_key_index(key)
    loop_through_keys { |index| return index if @keys.get(index) == key }
    nil
  end

  def loop_through_keys
    number_of_elements = @keys.length
    number_of_elements.times do |index|
      yield(index)
    end
  end


end