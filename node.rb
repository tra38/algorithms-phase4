require_relative 'set'

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

  def exists?(&block)
    original_node = self
    nodes.each do |node|
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

      edges.each do |edge|
        final_result = recursive_exists(block: block, original_node: original_node, current_node: edge, history: history)
        return true if final_result
      end
    end
    false
  end

end