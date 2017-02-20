require_relative "../fixed_array"

RSpec.describe "FixedArray" do
  array = FixedArray.new(5)
  it "gets an index that exist within an array" do
    expect(array.get(1)).to eq(nil)
  end

  it "refuses to get an index that exists outside an array" do
    expect{ array.get(6) }.to raise_error(IndexError)
  end

  it "can set a value of an index in an array" do
    expect(array.set(1, "cat")).to eq("cat")
    expect(array.get(1)).to eq("cat")
  end

  it "refuse to set a value of an index that exists outside of an array" do
    expect { array.set(6, "cat") }.to raise_error(IndexError)
  end

end