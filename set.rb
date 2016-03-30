require_relative 'array_list'

class MySet
  attr_reader :entries
  def initialize
    @entries = ArrayList.new(5)
  end

  def size
    entries.size
  end

  def contains?(element)
    index_position = element_search(element)
    if index_position
      return true
    else
      return false
    end
  end

  def add(element)
    entries.add(element) unless self.contains?(element)
  end

  def remove(element)
    index_position = element_search(element)
    if index_position
      # @size -= 1
      entries.set(index_position, nil)
      compact_entries
    else
      false
    end
  end

  def iterate(&block)
    size.times do |index|
      element = entries.get(index)
      block.call(element)
    end
  end

  private
  def element_search(element)
    size.times do |index|
      if entries.get(index) == element
        return index
      end
    end
    false
  end

  def compact_entries
    temp_entries = ArrayList.new(5)
    counter = 0
    size.times do |index|
      element = entries.get(index)
      if element == nil
        next
      else
        temp_entries.set(counter, element)
      end
    end
    @entries = temp_entries
  end

end