require_relative 'graph_node'

class BinaryTreeNode < GraphNode
  attr_accessor :left, :right

  def add_child(node)
    if left
      self.right = node
    else
      self.left = node
    end
  end

end