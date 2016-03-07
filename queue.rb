require_relative 'linked_list'

class MyQueue
  attr_reader :queue

  def initialize
    @queue = LinkedList.new
  end

  def peel
    node = queue.get(0)
    reveal_node(node)
  end

  def enqueue(element)
    node = Node.new(element)
    queue.insert_first(node)
  end

  def dequeue
    node = queue.remove_last
    reveal_node(node)
  end

  def empty?
    self.peel == nil
  end

  private
  def reveal_node(node)
    if node
      node.element
    else
      nil
    end
  end

    # last in, first out

end