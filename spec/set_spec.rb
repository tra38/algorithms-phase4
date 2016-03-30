require_relative '../set'

RSpec.describe "MySet" do

  describe "basic operations" do

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

  describe "advanced set operations" do
    before(:all) do
      @blank_set = MySet.new
      @set_one = MySet.new
      @set_two = MySet.new
      [1,2,3].each do |number|
        @set_one.add(number)
      end
      [3,4,5].each do |number|
        @set_two.add(number)
      end
    end
    it "can add two non-empty sets together" do
      final_set = [1,2,3,4,5]
      new_set = @set_one.union(@set_two)
      expect(new_set.size).to eq(5)
      final_set.each do |element|
        expect(new_set.contains?(element)).to be true
      end
    end

    it "can add two empty sets together" do
      new_set = @blank_set.union(@blank_set)
      expect(new_set.size).to eq(0)
    end

    it "can add a empty set and a non-empty set together" do
      final_set = [1,2,3]
      new_set = @blank_set.union(@set_one)
      expect(new_set.size).to eq(3)
      final_set.each do |element|
        expect(new_set.contains?(element)).to be true
      end
    end

    it "can find the intersection of two non-empty sets" do
      new_set = @set_one.intersection(@set_two)
      expect(new_set.size).to eq(1)
      expect(new_set.contains?(3)).to be true
    end

    it "can find the intersection of two empty sets" do
      new_set = @blank_set.intersection(@blank_set)
      expect(new_set.size).to eq(0)
    end

    it "can find the intersection of a empty set and a non-empty set" do
      new_set = @blank_set.intersection(@set_one)
      expect(new_set.size).to eq(0)
    end
  end



end