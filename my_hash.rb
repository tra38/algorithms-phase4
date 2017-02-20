require_relative 'array_list'

class MyHash
  attr_reader :array
  def initialize
    @array = ArrayList.new(5)
  end

  def set(key, value)
    index = hashing_function(key)
    @array.set(index, value)
  end

  def get(key)
    index = hashing_function(key)
    @array.get(index)
  end

  def remove(key)
    index = hashing_function(key)
    @array.set(index, nil)
  end

  def has_key?(key)
    index = hashing_function(key)
    if @array.get(index)
      true
    else
      false
    end
  end

  def hashing_function(string)
    string[0].ord
  end

  def size
    array.size
  end

end