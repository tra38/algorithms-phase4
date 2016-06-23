require_relative '../tree.rb'

RSpec.describe "Tree" do
  before(:each) do
    @bang = GraphNode.new("bang")
    @barbox = GraphNode.new("bar-box")
    @bazbox = GraphNode.new("baz-box")
    @foo = GraphNode.new("foo")
    @tree = Tree.new(@foo)
    @foo.add_child(@bang)
    @foo.add_child(@barbox)
    @barbox.add_child(@bazbox)
    @sir_not_appearing_in_this_tree = GraphNode.new("not_appearing_in_this_tree")
  end
  it "can find the root of a Tree (foo)" do
    expect(@tree.search { "foo" }).to eq(@foo)
  end

  it "can find bazbox" do
    expect(@tree.search { "baz-box"} ).to eq(@bazbox)
  end

  it "returns nil for nodes not appearing in this tree" do
    expect(@tree.search { "not_appearing_in_this_tree"} ).to eq(nil)
  end

  it "can find bang" do
    expect(@tree.search { "bang" }).to eq(@bang)
  end
end