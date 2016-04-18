require_relative '../node.rb'

RSpec.describe "Node" do
  before(:each) do
    @node = Node.new("lorem")
    @second_node = Node.new("ispum")
    @third_node = Node.new("hipster")
  end
  it "allows access to element" do
    expect(@node.element).to eq("lorem")
  end

  it "has values as an alias to element" do
    expect(@node.value).to eq("lorem")
  end

  it "be able to insert a node after your node" do
    @node.insert_after(@second_node)
    expect(@node.next).to eq(@second_node)
  end

  it "can remove a node as a pointer" do
    @node.insert_after(@second_node)
    @node.remove_after
    expect(@node.next).to eq(nil)
  end

  it "can add edges to a node" do
    @node.add_edge(@second_node)
    @node.add_edge(@third_node)
    expect(@node.nodes).to eq([@second_node, @third_node])
  end

end