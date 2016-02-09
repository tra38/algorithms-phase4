require_relative 'node'
require_relative 'array_list'

#ArrayList Implementation of LinkedList

# class LinkedList
#   attr_reader :head, :tail, :length, :size, :array_list

#   def initialize
#     @array_list = ArrayList.new(5)
#     @length = 0
#     @size = length + 1
#   end

#   def insert_first(element)
#     @head = element
#     @array_list.insert(0, @head)
#     @head.next = @array_list.get(1)
#     increase_length
#   end

#   def remove_first
#     if head
#       node = head
#       @head = node.next
#       decrease_length
#       create_new_array_list
#       node
#     end
#   end

#   def remove_last
#     if tail
#       node = tail
#       @array_list.set(@index, nil)
#       @tail = @array_list.get(tail_index - 1)
#       decrease_length
#       node
#     end
#   end

#   def insert_last(element)
#     @tail = element
#     @array_list.add(@tail)
#     attach_to_previous_node(tail_index, element)
#     increase_length
#   end

#   def tail_index
#     @length - 1
#   end

#   def get(index)
#     @array_list.get(index)
#   end

#   def set(index, element)
#     array_list.insert(index, element)
#     index_of_previous_node = index - 1
#     attach_to_previous_node(index_of_previous_node, element)
#     index_of_next_node = index + 1
#     attach_to_next_node(index_of_next_node, element)
#     increase_length
#   end

#   private

#   def increase_length
#     @length += 1
#   end

#   def decrease_length
#     @length -= 1
#   end

#   def attach_to_previous_node(index_of_previous_node, element)
#     if index_of_previous_node >= 0
#       previous_node = @array_list.get(index_of_previous_node)
#       previous_node.next = element if previous_node
#     end
#   end

#   def attach_to_next_node(index_of_next_node, element)
#     if index_of_next_node >= 0
#       next_node = @array_list.get(index_of_next_node)
#       element.next = next_node if next_node
#     end
#   end

#   def create_new_array_list
#     new_array_list = ArrayList.new(5)
#     length.times do |index|
#       element = array_list.get(index + 1)
#       new_array_list.set(index, element)
#     end
#     @array_list = new_array_list
#   end

# end

#Node Implementation of LinkedList
class LinkedList
  attr_reader :head, :tail, :array_list
  attr_accessor :size

  def initialize
    @size = 0
  end

  def insert_first(element)
    next_node = head
    @head = element
    @head.next = next_node
    increase_size
  end

  def remove_first
    if head
      head_to_remove = head
      next_node = head.next
      head.next = nil
      @head = next_node
      decrease_size
      head_to_remove
    end
  end

  def remove_last
    if tail
      tail_to_remove = tail
      @tail = node_before_tail
      decrease_size
      tail_to_remove
    end
  end

  def insert_last(element)
    @tail = element
    node_before_tail.next = element if node_before_tail
    increase_size
  end

  def get(index)
    current_node = head
    index.times do
      current_node = current_node.next
    end
    current_node
  end

  def set(index, element)
    index_of_previous_node = index - 1
    index_of_next_node = index
    previous_node = self.get(index_of_previous_node)
    next_node = self.get(index_of_next_node)
    if previous_node
      previous_node.next = element
    end
    if next_node
      element.next = next_node
    end
    increase_size
  end

  #A O(n) implementation of size (I had already made an O(1) version)
  # def counter
  #   counter = 0
  #   current_node = head
  #   until current_node == nil
  #     counter += 1
  #     current_node = current_node.next
  #   end
  #   counter
  # end

  private

  def increase_size
    self.size += 1
  end

  def decrease_size
    self.size -= 1
  end

  def node_before_tail
    self.get(size - 2)
  end

end