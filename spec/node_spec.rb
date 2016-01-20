require_relative '../node.rb'

RSpec.describe do
  before(:each) do
    @node = Node.new("lorem")
  end
  it "allows access to element" do
    expect(@node.element).to eq("lorem")
  end

  it "be able to insert a node after your node" do
    @second_node = Node.new("ispum")
    @node.insert_after(@second_node)
    expect(@node.next).to eq(@second_node)
  end

  it "can remove a node as a pointer" do
    @second_node = Node.new("ispum")
    @node.insert_after(@second_node)
    @node.remove_after
    expect(@node.next).to eq(nil)
  end


end