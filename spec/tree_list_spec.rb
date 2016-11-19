require_relative '../tree_list.rb'

RSpec.describe "TreeList" do
  before(:each) do
    @root_node = BinaryTreeNode.new(10)
    @eight_node = BinaryTreeNode.new(8)
    @nine_node = BinaryTreeNode.new(9)
    @eleven_node = BinaryTreeNode.new(11)
    @twelve_node = BinaryTreeNode.new(12)

    @tree = TreeList.new(@root_node)
    [@eight_node, @nine_node, @eleven_node, @twelve_node].each do |node|
      @tree.add(node)
    end
  end

  it "returns the correct size of the TreeList" do
    expect(@tree.size).to eq(5)
  end

  it "iterate over a sorted list" do
    array = []
    @tree.each { |node| array << node.value }
    expect(array).to eq ([8,9,10,11,12])
  end

  it "successfuly resort the list if a new element is added" do
    @super_node = BinaryTreeNode.new(10.5)
    @tree.add(@super_node)
    array = []
    @tree.each { |node| array << node.value }
    expect(array).to eq([8,9,10,10.5,11,12])
  end

  it "find the index of an element" do
    expect(@tree.index_of(10)).to eq(2)
  end

  it "returns nil if the element does not exist" do
    expect(@tree.index_of("cat")).to eq(nil)
  end

  it "returns true if an element is contained within the Tree" do
    expect(@tree.contains?(12)).to eq(true)
  end

  it "returns false if an element is not contained within the Tree" do
    expect(@tree.contains?(-1)).to eq(false)
  end

  it "returns false if an element is not comparable to anything in the Tree" do
    expect(@tree.contains?("cat")).to eq(false)
  end

end