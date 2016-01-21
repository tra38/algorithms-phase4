require_relative 'node'
require_relative 'array_list'

class LinkedList
  attr_reader :head, :tail, :length, :array_list

  def initialize
    @array_list = ArrayList.new(5)
    @length = 0
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
      node
    end
  end

  def insert_last(element)
    @tail = element
    @array_list.add(@tail)
    index_of_previous_node = @length - 1
    if index_of_previous_node >= 0
      previous_node = @array_list.get(index_of_previous_node)
      previous_node.next = @tail if previous_node
    end
    increase_length
  end

  def get(index)
    @array_list.get(index)
  end

  private

  def increase_length
    @length += 1
  end

  def decrease_length
    @length -= 1
  end

end