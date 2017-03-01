require_relative 'array_list'
require_relative 'linked_list'

# We need to insert linked nodes into the array and then dig deep through them to handle
# collisions.

class MyHash
  attr_reader :array
  def initialize
    @array = ArrayList.new(100)
  end

  def set(key, value)
    index = hashing_function(key)
    set_value(index: index, key: key, value: value)
  end

  def get(key)
    index = hashing_function(key)
    get_value(index: index, key: key)
  end

  def remove(key)
    index = hashing_function(key)
    remove_value(index: index, key: key)
  end

  def has_key?(key)
    if get(key)
      true
    else
      false
    end
  end

  def hashing_function(string)
    key = string.to_s
    key[0].ord
  end

  private
  def access_potential_linked_list(index)
    array.get(index)
  end

  def set_value(index:, key:, value:)
    linked_list = access_potential_linked_list(index)
    if linked_list
      set_node(linked_list: linked_list, key: key, value: value)
    else
      create_linked_list(index: index, key: key, value: value)
    end
    value
  end

  def get_value(index:, key:)
    linked_list = access_potential_linked_list(index)
    if linked_list
      node = tranverse_linked_list(linked_list: linked_list, key: key)
      key_value_array = node.element
      key_value_array.get(1)
    else
      nil
    end
  end

  def remove_value(index:, key:)
    linked_list = access_potential_linked_list(index)
    if linked_list
      set_node(linked_list: linked_list, key: key, value: nil)
    else
      nil
    end
  end

  def create_linked_list(index:, key:, value:)
    new_linked_list = LinkedList.new
    new_linked_list.insert_first(node(key: key, value: value))
    array.set(index, new_linked_list)
  end

  def set_node(linked_list:, key:, value:)
    node = tranverse_linked_list(linked_list: linked_list, key: key)
    if node
      modify_node(node: node, value: value)
    else
      linked_list.insert_last(node(key: key, value: value))
    end
    value
  end

  def tranverse_linked_list(linked_list:, key:)
    current_node = linked_list.head

    # may need to replace loop with recursive travel
    while current_node
      key_value_array = current_node.element
      if key_value_array.get(0) == key
        return current_node
      else
        current_node = current_node.next
      end
    end

    #If we haven't returned out from the loop yet, indicate that we failed to find the key
    false
  end

  def node(key:, value:)
    key_value_array = FixedArray.new(2)
    key_value_array.set(0, key)
    key_value_array.set(1, value)
    Node.new(key_value_array)
  end

  def modify_node(node:, value:)
    key_value_array = node.element

    key_value_array.set(1, value)
  end

end