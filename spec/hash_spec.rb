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

  describe "#has_key?" do
    it "returns true if a key exists" do
      expect(@hash.has_key?("alpha")).to eq(true)
    end

    it "returns false if a key doesn't exist" do
      expect(@hash.has_key?("omega")).to eq(false)
    end
  end

  describe "#hashing_function" do
    it "correctly hashes words" do
      expect(@hash.hashing_function("beta")).to eq(98)
    end

    it "correctly hashes numbers" do
      expect(@hash.hashing_function(5)).to eq(53)
    end

    it "has a hashing collision when the first character of the key is the same" do
      expect(@hash.hashing_function("beta")).to eq(@hash.hashing_function("blah"))
    end
  end

  describe "hashing collisions" do
    it "can still successfuly retrieve values in the event of a hashing collision" do
      @hash.set("blah", 5)
      expect(@hash.get("beta")).to eq(2)
      expect(@hash.get("blah")).to eq(5)
    end

    it "can still remove values in the event of an hashing collision" do
      @hash.set("blah", 5)
      @hash.remove("beta")
      expect(@hash.get("beta")).to eq(nil)
      expect(@hash.get("blah")).to eq(5)
    end

    it "returns proper values for has_key? if a key exists" do
      @hash.set("blah", 5)
      expect(@hash.has_key?("beta")).to eq(true)
      expect(@hash.has_key?("blah")).to eq(true)
    end

    it "returns proper values for has_key? if a key has been removed" do
      @hash.set("blah", 5)
      @hash.remove("beta")
      expect(@hash.has_key?("beta")).to eq(false)
      expect(@hash.has_key?("blah")).to eq(true)
    end
  end

end

