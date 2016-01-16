require_relative '../array_list.rb'

RSpec.describe do
  before(:each) do
    @array = ArrayList.new(5)
  end

  it "can add a new element to this ArrayList" do
    expect(@array.size).to eq(5)
    expect(@array.add("cat")).to eq("cat")
    expect(@array.size).to eq(6)
  end

  it "can get an element in this ArrayList" do
    expect(@array.get(0)).to eq(nil)
  end

  it "can set a value of an element in an ArrayList" do
    expect(@array.set(0, "cat")).to eq("cat")
    expect(@array.get(0)).to eq("cat")
  end






end