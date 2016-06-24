require_relative '../binary_tree_node.rb'

RSpec.describe "BinaryTreeNode" do
  before(:all) do
    @node = BinaryTreeNode.new("lorem")
    @second_node = BinaryTreeNode.new("ispum")
    @third_node = BinaryTreeNode.new("hipster")
    @node.add_child(@second_node)
    @node.add_child(@third_node)
  end

  it "successfully sets a Left Node" do
    expect(@node.left).to eq(@second_node) 
  end

  it "successfully sets a Right Node" do
    expect(@node.right).to eq(@third_node)
  end

  it "ensures that the Left Node is empty if nobody assigns anything" do
    expect(@second_node.left).to eq(nil)
  end

  it "ensures that the Right Node is empty if nobody assigns anything to that node" do
    expect(@second_node.right).to eq(nil)
  end

end