require_relative 'binary_tree_node'
require_relative 'tree'
require 'pry'

class TreeList
  attr_reader :tree, :root
  def initialize(root)
    @tree = Tree.new(root)
    @root = root
  end

  def add(element)
    root.add_child(element)
  end

  def size
    root.downstream_nodes + 1
  end

  def each(&block)
    travel(root, &block)
  end

  def travel(current_node, &block)
    travel(current_node.left, &block) if current_node.left
    yield(current_node)
    travel(current_node.right, &block) if current_node.right
  end

  def index_of(element)
    counter = 0
    each do |node|
      if node.value == element
        return counter
      else
        counter += 1
      end
    end
  end

  #  O(log n) implementation of contains?
  def contains?(element)
    search_tree(root, element)
  end

  def search_tree(current_node, element)
    direction = determine_direction(element <=> current_node.value)
    if (direction == true) || (direction == false)
      return direction
    end
    possible_node = current_node.send(:"#{direction}")
    if possible_node
      search_tree(possible_node, element)
    else
      false
    end
  end

  def determine_direction(result_of_comparison)
    case result_of_comparison
    when 1
      :right
    when -1
      :left
    when nil
      false
    when 0
      true
    end
  end

  # O(n) implementation of contains?
  # def contains?(element)
  #   if index_of(element)
  #     true
  #   else
  #     false
  #   end
  # end


end