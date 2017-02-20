require_relative '../my_hash.rb'

RSpec.describe "Hash" do
  before(:each) do
    @hash = MyHash.new
    @hash.set("alpha",1)
    @hash.set("beta",2)
  end

  it "can retrieve a value when given a key" do
    expect(@hash.get("alpha")).to eq(1)
  end

  it "can replace the value of a key" do
    @hash.set("beta",3)
    expect(@hash.get("beta")).to eq(3)
  end

  it "can delete the value of a key" do
    @hash.remove("beta")
    expect(@hash.get("beta")).to eq(nil)
  end

  it "can retrieve the size of a Hash" do
    expect(@hash.size).to eq(2)
  end

  describe "#has_key?" do
    it "returns true if a key exists" do
      expect(@hash.has_key?("alpha")).to eq(true)
    end

    it "returns false if a key doesn't exist" do
      expect(@hash.has_key?("omega")).to eq(false)
    end
  end

  describe "#hashing_function"

  it "correctly hashes words" do
    expect(@hash.hashing_function("beta")).to eq(98)
  end

  it "correctly hashes numbers" do
    expect(@hash.hashing_function(5)).to eq(53)
  end

end

