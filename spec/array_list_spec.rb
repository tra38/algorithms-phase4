require_relative '../array_list.rb'

RSpec.describe "ArrayList" do
  before(:each) do
    @array = ArrayList.new(5)
  end

  it "can add a new element to this ArrayList" do
    expect(@array.size).to eq(0)
    expect(@array.add("cat")).to eq("cat")
    expect(@array.get(0)).to eq("cat")
    expect(@array.size).to eq(1)
  end

  it "can get an element in this ArrayList" do
    expect(@array.get(0)).to eq(nil)
  end

  it "can set a value of an element in an ArrayList" do
    expect(@array.set(0, "cat")).to eq("cat")
    expect(@array.get(0)).to eq("cat")
  end

  it "increase the size of an ArrayList if setting a value that was previously nil" do
    expect(@array.size).to eq(0)
    @array.set(0, "cat")
    expect(@array.size).to eq(1)
  end

  it "decreases the size of an ArrayList if you are setting a value to nil" do
    @array.set(0,"cat")
    @array.set(0, nil)
    expect(@array.size).to eq(0)
  end

  it "can insert an element in this ArrayList" do
    expect(@array.insert(1,"cat")).to eq("cat")
    expect(@array.get(1)).to eq("cat")
    expect(@array.size).to eq(1)
  end

  it "can successfully resize an ArrayList" do
    expect(@array.length).to eq(10)
    11.times do
      @array.add("cat")
    end
    expect(@array.get(10)).to eq("cat")
    expect(@array.size).to eq(11)
    expect(@array.length).to eq(20)
  end

  it "avoids resizing an ArrayList needlessly when adding" do
    10.times do
      @array.add("cat")
      expect(@array.length).to eq(10)
    end
  end

  it "avoids resizing an ArrayList needlessly when inserting" do
    10.times do
      @array.insert(1,"cat")
      expect(@array.length).to eq(10)
    end
  end

  it "can automatically expand an ArrayList by setting an element 'out-of-bounds'" do
    @array.set(100, "elephant")
    expect(@array.get(100)).to eq("elephant")
  end

end