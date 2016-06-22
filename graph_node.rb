require_relative 'set'

class GraphNode
  attr_reader :value, :nodes
  def initialize(value)
    @value = value
    @nodes = MySet.new
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