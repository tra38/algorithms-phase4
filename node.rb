class Node
  attr_reader :element, :next
  def initialize(element)
    @element = element
    @next = nil
  end

  def insert_after(node)
    @next = node
  end

  def remove_after
    @next = nil
  end



end