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

  def iterate
    size.times do |index|
      element = entries.get(index)
      yield(element)
    end
  end

  def union(other_set)
    new_set = MySet.new
    self.iterate do |element|
      new_set.add(element)
    end
    other_set.iterate do |element|
      new_set.add(element)
    end
    new_set
  end

  def intersection(other_set)
    new_set = MySet.new
    self.iterate do |element|
      new_set.add(element) if other_set.contains?(element)
    end
    new_set
  end

  def difference(other_set)
    new_set = MySet.new
    self.iterate do |element|
      if other_set.contains?(element)
        next
      else
        new_set.add(element)
      end
    end
    new_set
  end

  def subset?(other_set)
    other_set.iterate do |element|
      if self.contains?(element)
        next
      else
        return false
      end
    end
    true
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