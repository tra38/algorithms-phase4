class Tree
  attr_reader :root
  def initialize(root)
    @root = root
  end

  def search(&block)
    search_term = block.call
    recursive_search(@root, search_term)
  end
  
  private
  def recursive_search(node, search_term)
    if node.value == search_term
      return node
    else
      edges = node.children
      edges.iterate do |edge|
        result = recursive_search(edge, search_term)
        if result
          return result
        end
      end
      nil
    end
  end

end