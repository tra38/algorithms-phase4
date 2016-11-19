require_relative 'graph_node'

class BinaryTreeNode < GraphNode
  attr_accessor :left, :right

  def add_child(node)
    direction = determine_direction(node)
    send_child_to_proper_location(node, direction)
  end

  def determine_direction(node)
    direction = (node.value <=> self.value)
    case direction
    when 1
      :right
    when 0
      raise "Same Node Is Being Inserted"
    else
      :left
    end
  end

  def send_child_to_proper_location(node, direction)
    possible_parent_node = self.send(direction)
    if possible_parent_node
      possible_parent_node.add_child(node)
    else
      self.send(:"#{direction}=", node)
      self.add_edge(node)
    end
  end

  def downstream_nodes
    total_size = children.size
    children.iterate { |node| total_size += node.downstream_nodes }
    total_size
  end
end