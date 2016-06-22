require_relative 'set'

# The Node class is odd since it is used in LinkedLists, Graphs, and Trees. Such a complicated GodObject *could* be refactored into smaller
# entities. Doing so could prevent situations where a person accidentally use a method for the wrong thing. 

class Node
  attr_reader :element, :nodes
  attr_accessor :next

  def initialize(element)
    @element = element
    @nodes = MySet.new
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
    nodes.add(node)
  end

#These "helper" methods are used when creating Trees. 
  def add_child(node)
    add_edge(node)
  end

  def children
    nodes
  end

  def exists?(&block)
    original_node = self
    nodes.iterate do |node|
      final_result = recursive_exists(block: block, original_node: original_node, current_node: node, history: MySet.new)
      return true if final_result
    end
    false
  end

  private
  def recursive_exists(args)
    current_node = args[:current_node]
    original_node = args[:original_node]
    history = args[:history]
    block = args[:block]

    if block.call(current_node)
      return true
    elsif history.contains?(current_node)
      return false
    else
      history.add(current_node)
      edges = current_node.nodes

      edges.iterate do |edge|
        final_result = recursive_exists(block: block, original_node: original_node, current_node: edge, history: history)
        return true if final_result
      end
    end
    false
  end

end