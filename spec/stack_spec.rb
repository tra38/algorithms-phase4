require_relative '../stack.rb'

RSpec.describe "Stack" do
  before(:each) do
    @stack = Stack.new
  end

  it "should have no values when initialized" do
    expect(@stack.top).to eq(nil)
  end

  it "allows you to push to a stack" do
    @stack.push("republic")
    expect(@stack.top).to eq("republic")
  end

  describe "#pop" do

    it "allows you to pop from a stack" do
      @stack.push("republic")
      expect(@stack.pop).to eq("republic")
      expect(@stack.top).to eq(nil)
    end

    it "allows you to pop from an empty stack" do
      expect(@stack.pop).to eq(nil)
    end

    it "should handle stacks that are larger than one element" do
      @stack.push("republic")
      @stack.push("kingdom")
      expect(@stack.pop).to eq("kingdom")
      expect(@stack.top).to eq("republic")
    end
  end
  describe "empty?" do
    it "should return true if empty" do
      expect(@stack.empty?).to be(true)
    end

    it "should return false if not empty" do
      @stack.push("republic")
      expect(@stack.empty?).to be(false)
    end
  end

end