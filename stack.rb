require_relative 'linked_list'

# Linked List Version
# class Stack
#   attr_reader :stack

#   def initialize
#     @stack = LinkedList.new
#   end

#   def top
#     node = stack.get(0)
#     reveal_node(node)
#   end

#   def push(element)
#     node = Node.new(element)
#     stack.insert_first(node)
#   end

#   def pop
#     node = stack.remove_first
#     reveal_node(node)
#   end

#   def empty?
#     self.top == nil
#   end

#   private
#   def reveal_node(node)
#     if node
#       node.element
#     else
#       nil
#     end
#   end

# end

#Array List Version
class Stack
  def initialize
    @stack = ArrayList.new(5)
  end

  def top
    @stack.get(0)
  end

  def push(element)
    @stack.insert(0,element)
  end

  def pop
    value = self.top
    create_new_array_list
    value
  end

  def empty?
    self.top == nil
  end

  private
  def create_new_array_list
    old_stack_length = @stack.size
    new_stack = ArrayList.new(5)
    old_stack_length.times do |index|
      old_value = @stack.get(index + 1)
      new_stack.set(index, old_value)
    end
    @stack = new_stack
  end
end