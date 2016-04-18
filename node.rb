class Node
  attr_reader :element, :nodes
  attr_accessor :next

  def initialize(element)
    @element = element
    @nodes = []
    @next = nil
  end

  def insert_after(node)
    @next = node
  end

  def remove_after
    @next = nil
  end

  def value
    element
  end

  def add_edge(node)
    nodes << node
  end

end