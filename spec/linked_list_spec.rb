require_relative '../linked_list.rb'

RSpec.describe do

  before(:each) do
    @linked_list = LinkedList.new
    @front_node = Node.new("dog")
    @back_node = Node.new("cat")
  end

#Consider reducing duplicate code by creating different 'describe'
#blocks, which each describe block containing boilerplate
#code, and the automated tests doing its own unique things.
  it "can insert a node in front of a linked list" do
    @linked_list.insert_first(@front_node)
    expect(@linked_list.head).to eq(@front_node)
  end

  it "can remove a node in the front of a linked list, if such a node exists" do
    @linked_list.insert_first(@front_node)
    expect(@linked_list.remove_first).to eq(@front_node)
    expect(@linked_list.head).to eq(nil)
    expect(@linked_list.get(0)).to eq(nil)
  end

  it "can remove a node in the front of a linked list and promote the next node to the new 'head' " do
    @linked_list.insert_first(@front_node)
    @linked_list.insert_last(@back_node)
    @linked_list.remove_first
    expect(@linked_list.head).to eq(@back_node)
    expect(@linked_list.get(0)).to eq(@back_node)
  end

  it "can remove a node in the back of a linked_list and promote the previous node to the new 'tail' " do
    @linked_list.insert_first(@front_node)
    @linked_list.insert_last(@back_node)
    expect(@linked_list.remove_last).to eq(@back_node)
    expect(@linked_list.tail).to eq(@front_node)
    expect(@linked_list.get(0)).to eq(@front_node)
  end



  it "returns nil if a user tries to remove a node in front of a linked list, but no such node exists" do
    expect(@linked_list.remove_first).to eq(nil)
  end

  it "can insert a node in the back of a linked list" do
    @linked_list.insert_last(@back_node)
    expect(@linked_list.tail).to eq(@back_node)
  end

  it "can get an element in front of a linked list" do
    @linked_list.insert_first(@front_node)
    expect(@linked_list.get(0)).to eq(@front_node)
  end

  it "ensures that the head will point to the next item in the list" do
    @linked_list.insert_first(@front_node)
    @linked_list.insert_last(@back_node)
    expect(@front_node.next).to eq(@back_node)
  end

  describe "can insert a node in the middle of the linked list" do
    before(:each) do
      @linked_list.insert_first(@front_node)
      @linked_list.insert_last(@back_node)
      @middle_node = Node.new("parrot")
      @returned_value = @linked_list.set(1,@middle_node)
    end

    it "expects the returned value to equal the size of the list" do
      expect(@returned_value).to eq(3)
    end

    it "inserts the node in the correct location" do
      expect(@linked_list.get(1)).to eq(@middle_node)
    end

    it "connects the previous node in the linked list to the inserted node" do
      expect(@front_node.next).to eq(@middle_node)
    end

    it "connects the inserted node to the next node in the linked list" do
      expect(@middle_node.next).to eq(@back_node)
    end
  end

end