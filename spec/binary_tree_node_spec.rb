require_relative '../binary_tree_node.rb'

RSpec.describe "BinaryTreeNode" do
  describe "insert nodes with the proper order" do
    before(:all) do
      @root_node = BinaryTreeNode.new(10)
      @eight_node = BinaryTreeNode.new(8)
      @nine_node = BinaryTreeNode.new(9)
      @eleven_node = BinaryTreeNode.new(11)
      @twelve_node = BinaryTreeNode.new(12)
      [@eight_node, @nine_node, @eleven_node, @twelve_node].each do |node|
        @root_node.add_child(node)
      end
    end
    it "declares 8 as the Left Node of the Root Node" do
      expect(@root_node.left).to eq(@eight_node)
    end

    it "declares 11 as the Right Node of the Root Node" do
      expect(@root_node.right).to eq(@eleven_node)
    end

    it "declares no Left Node for 8 Node" do
      expect(@eight_node.left).to eq(nil)
    end

    it "declares 9 as the Right Node of the 8 Node" do
      expect(@eight_node.right).to eq(@nine_node)
    end

    it "raises a RunTimeError if the same node is being added" do
      @awesome_node = BinaryTreeNode.new(10)
      expect{ @root_node.add_child(@awesome_node) }.to raise_error("Same Node Is Being Inserted")
    end
  end

end