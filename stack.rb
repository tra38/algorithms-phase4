require_relative 'linked_list'

# Linked List Version
class Stack
  attr_reader :stack

  def initialize
    @stack = LinkedList.new
  end

  def top
    node = stack.get(0)
    reveal_node(node)
  end

  def push(element)
    node = Node.new(element)
    stack.insert_first(node)
  end

  def pop
    node = stack.remove_first
    reveal_node(node)
  end

  def empty?
    self.top == nil
  end

  private
  def reveal_node(node)
    if node
      node.element
    else
      nil
    end
  end

end