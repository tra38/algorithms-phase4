require_relative '../map.rb'
require_relative '../set.rb'

RSpec.describe "Map" do
  before(:each) do
    @map = Map.new
    @map.set("alpha",1)
    @map.set("beta",2)
  end

  it "can retrieve a value when given a key" do
    expect(@map.get("alpha")).to eq(1)
  end

  it "can replace the value of a key" do
    @map.set("beta",3)
    expect(@map.get("beta")).to eq(3)
  end

  it "can delete the value of a key" do
    @map.remove("beta")
    expect(@map.get("beta")).to eq(nil)
  end

  describe "#iterate" do
    before(:all) do
      @map = Map.new
      @map.set("alpha",1)
      @map.set("beta",2)
      @sum_of_values = 0
      @set_of_keys = MySet.new
      @map.iterate { |value, key| @set_of_keys.add(key); @sum_of_values += value }
    end

    it "can iterate over values" do
      expect(@sum_of_values).to eq(3)
    end

    it "can iterate over keys" do
      expect(@set_of_keys.size).to eq(2)
      expect(@set_of_keys.contains?("alpha")).to eq(true)
      expect(@set_of_keys.contains?("beta")).to eq(true)
    end

  end

  describe "#has_key?" do
    it "returns true if a key exists" do
      expect(@map.has_key?("alpha")).to eq(true)
    end

    it "returns false if a key doesn't exist" do
      expect(@map.has_key?("omega")).to eq(false)
    end

    it "returns false if a key is deleted" do
      @map.remove("beta")
      expect(@map.get("beta")).to eq(nil)
    end
  end

end