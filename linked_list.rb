require_relative 'node'
require_relative 'array_list'

class LinkedList
  attr_reader :head, :tail, :length, :size, :array_list

  def initialize
    @array_list = ArrayList.new(5)
    @length = 0
    @size = length + 1
  end

  def insert_first(element)
    @head = element
    @array_list.insert(0, @head)
    @head.next = @array_list.get(1)
    increase_length
  end

  def remove_first
    if head
      node = head
      @head = nil
      decrease_length
      create_new_array_list
      node
    end
  end

  def insert_last(element)
    @tail = element
    @array_list.add(@tail)
    index_of_previous_node = @length - 1
    attach_to_previous_node(index_of_previous_node, element)
    increase_length
  end

  def get(index)
    @array_list.get(index)
  end

  def set(index, element)
    array_list.insert(index, element)
    index_of_previous_node = index - 1
    attach_to_previous_node(index_of_previous_node, element)
    index_of_next_node = index + 1
    attach_to_next_node(index_of_next_node, element)
    increase_length
  end

  private

  def increase_length
    @length += 1
  end

  def decrease_length
    @length -= 1
  end

  def attach_to_previous_node(index_of_previous_node, element)
    if index_of_previous_node >= 0
      previous_node = @array_list.get(index_of_previous_node)
      previous_node.next = element if previous_node
    end
  end

  def attach_to_next_node(index_of_next_node, element)
    if index_of_next_node >= 0
      next_node = @array_list.get(index_of_next_node)
      element.next = next_node if next_node
    end
  end

  def create_new_array_list
    new_array_list = ArrayList.new(5)
    length.times do |index|
      element = array_list.get(index + 1)
      new_array_list.set(index + 1, element)
    end
    @array_list = new_array_list
  end

end