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

  describe "#exists? (acyclical)" do
    it "returns true if a node has a First Degree connection to the target node ('ispum')" do
      @node.add_edge(@second_node)
      expect(@node.exists? { "ispum" }).to eq(true)
    end

    it "returns false if a node has no connection to the target node ('hipster')" do
      @node.add_edge(@second_node)
      expect(@node.exists? { "hipster" }).to eq(false)
    end

    it "returns true if a node has a Second Degree connection to the target node ('hipster')" do
      @node.add_edge(@second_node)
      @node.add_edge(@third_node)
      expect(@node.exists? { "hipster" }).to eq(true)
    end
  end

  describe "#exists? (cylical)"
    it "returns true if a node has a First Degree connection to the target node ('ispum')" do
      @node.add_edge(@second_node)
      @second_node.add_edge(@third_node)
      @third_node.add_edge(@node)
      expect(@node.exists? { "ispum" }).to eq(true)
    end

  it "returns false if a node has no connection to the target node ('hipster')" do
    @dummy_node = Node.new("dummy")
    @node.add_edge(@second_node)
    @second_node.add_edge(@dummy_node)
    @dummy_node.add_edge(@node)
    expect(@node.exists? { "hipster" }).to eq(false)
  end

  it "returns true if a node has a Second Degree connection to the target node ('hipster')" do
    @node.add_edge(@second_node)
    @second_node.add_edge(@third_node)
    @third_node.add_edge(@node)
    expect(@node.exists? { "hipster" }).to eq(true)
  end

end