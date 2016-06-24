require_relative 'queue'
require_relative 'set'

class GraphNode
  attr_reader :value, :nodes
  def initialize(value)
    @value = value
    @nodes = MyQueue.new
  end

  def add_edge(node)
    nodes.enqueue(node)
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
    list_of_edges = nodes.dup
    until list_of_edges.empty?
      node = list_of_edges.dequeue
      final_result = recursive_exists(block: block, original_node: original_node, current_node: node, history: MySet.new )
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
      list_of_edges = current_node.nodes.dup
      until list_of_edges.empty?
        edge = list_of_edges.dequeue
        final_result = recursive_exists(block: block, original_node: original_node, current_node: edge, history: history)
        return true if final_result
      end
    end
    false
  end
end