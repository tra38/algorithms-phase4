require_relative 'my_hash'

# MUST BE CONSTANT TIME -
# add, remove, contains, and size

class HashSet
  attr_reader :entries, :element_array, :elements_locator
  attr_accessor :size
  def initialize
    @size = 0
    @entries = MyHash.new
    @element_array = ArrayList.new(10)
    @elements_locator = MyHash.new
  end

  def contains?(element)
    entries.has_key?(element)
  end

  def add(element)
    unless contains?(element)
      entries.set(element, element)

      self.size += 1

      save_element_location(element)
    end
  end

  def remove(element)
    if contains?(element)
      entries.remove(element)

      self.size -= 1

      remove_element_location(element)
    else
      false
    end
  end

  def iterate
    index = 0
    length_of_elements = element_array.length

    while index < length_of_elements
      key = element_array.get(index)
      if key
        value = entries.get(key)
        yield(value)
      end
      index += 1
    end
  end

  def union(other_set)
    new_set = HashSet.new
    self.iterate do |element|
      new_set.add(element)
    end
    other_set.iterate do |element|
      new_set.add(element)
    end
    new_set
  end

  def intersection(other_set)
    new_set = HashSet.new
    self.iterate do |element|
      new_set.add(element) if other_set.contains?(element)
    end
    new_set
  end

  def difference(other_set)
    new_set = HashSet.new
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
  def save_element_location(element)
    element_array.add(element)
    index = element_array.size - 1
    elements_locator.set(element, index)
  end

  def remove_element_location(element)
    index = elements_locator.get(element)
    element_array.set(index, nil)
    elements_locator.remove(element)
  end
end