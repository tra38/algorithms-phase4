require_relative '../set'

RSpec.describe "MySet" do
  before(:each) do
    @set = MySet.new
    @word = "cough"
  end

  it "starts off as an empty set" do
    expect(@set.size).to eq(0)
    expect(@set.contains?(@word)).to eq(false)
  end

  it "add an element to the set" do
    @set.add(@word)
    expect(@set.size).to eq(1)
    expect(@set.contains?(@word)).to eq(true)
  end

  it "can remove an element from the set" do
    word = "cough"
    @set.add(@word)
    @set.remove(@word)
    expect(@set.size).to eq(0)
    expect(@set.contains?(word)).to eq(false)
  end

  it "can iterate through a Set" do
    @set.add(1)
    @set.add(2)
    @set.add(3)
    sum = 0
    @set.iterate { |number| sum += number }
    expect(sum).to eq(6)
  end

  it "will not have duplicate versions of the same element" do
    @set.add(@word)
    @set.add(@word)
    expect(@set.size).to eq(1)
  end

end