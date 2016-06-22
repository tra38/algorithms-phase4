require_relative '../graph_node.rb'

RSpec.describe "GraphNode" do
  before(:each) do
    @node = Node.new("lorem")
    @second_node = Node.new("ispum")
    @third_node = Node.new("hipster")
    @dummy_node = Node.new("dummy")
  end

  it "can add edges to a node" do
    @node.add_edge(@second_node)
    @node.add_edge(@third_node)
    edges = @node.nodes
    expect(edges.contains?(@second_node)).to eq(true)
    expect(edges.contains?(@third_node)).to eq(true)
  end

  describe "#exists? (acyclical)" do
    it "returns true if a node has a First Degree connection to the target node ('ispum')" do
      @node.add_edge(@second_node)
      expect(@node.exists? { |node| node.element == "ispum" }).to eq(true)
    end

    it "returns false if a node has no connection to the target node ('hipster')" do
      @node.add_edge(@second_node)
      expect(@node.exists? { |node| node.element == "hipster" }).to eq(false)
    end

    it "returns true if a node has a Second Degree connection to the target node ('hipster')" do
      @node.add_edge(@second_node)
      @node.add_edge(@third_node)
      expect(@node.exists? { |node| node.element == "hipster" }).to eq(true)
    end
  end

  describe "#exists? (cylical)"
    it "returns true if a node has a First Degree connection to the target node ('ispum')" do
      @node.add_edge(@second_node)
      @second_node.add_edge(@third_node)
      @third_node.add_edge(@node)
      expect(@node.exists? { |node| node.element == "ispum" }).to eq(true)
    end

  it "returns false if a node has no connection to the target node ('hipster')" do
    @node.add_edge(@second_node)
    @second_node.add_edge(@dummy_node)
    @dummy_node.add_edge(@node)
    expect(@node.exists? { |node| node.element == "hipster" }).to eq(false)
  end

  it "returns true if a node has a Second Degree connection to the target node ('hipster')" do
    @node.add_edge(@second_node)
    @second_node.add_edge(@third_node)
    @third_node.add_edge(@node)
    expect(@node.exists? { |node| node.element == "hipster" }).to eq(true)
  end

  describe "#exists? (kinda cylical)" do
    it "returns true if a node has a Second Degree Connection to the Target Node" do
      @node.add_edge(@second_node)
      @second_node.add_edge(@node)
      @second_node.add_edge(@third_node)
      @third_node.add_edge(@second_node)
      expect(@node.exists? { |node| node.element == "hipster" }).to eq(true)
    end

    it "returns false if a node has no connection to the target node" do
      @node.add_edge(@second_node)
      @second_node.add_edge(@node)
      @second_node.add_edge(@dummy_node)
      @dummy_node.add_edge(@second_node)
      expect(@node.exists? { |node| node.element == "hipster" }).to eq(false)
    end

  end
  
end