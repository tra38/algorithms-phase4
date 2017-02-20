require_relative '../hash_set'

RSpec.describe "HashSet" do

  describe "basic operations" do

    before(:each) do
      @set = HashSet.new
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
      @set.add(@word)
      @set.remove(@word)
      expect(@set.size).to eq(0)
      expect(@set.contains?(@word)).to eq(false)
    end

    it "can remove an element from the set without affecting all other elements" do
      @second_word = "second word"
      @third_word = "third word"
      [@word, @second_word, @third_word].each do |word|
        @set.add(word)
      end
      @set.remove(@word)
      expect(@set.size).to eq(2)
      expect(@set.contains?(@second_word)).to eq(true)
      expect(@set.contains?(@third_word)).to eq(true)
    end

    it "can iterate through a Set" do
      @set.add(1)
      @set.add(2)
      @set.add(3)
      sum = 0
      @set.iterate { |number| binding.pry; sum += number }
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
      @blank_set = HashSet.new
      @set_one = HashSet.new
      @set_two = HashSet.new
      @large_set = HashSet.new
      [1,2,3].each do |number|
        @set_one.add(number)
      end
      [3,4,5].each do |number|
        @set_two.add(number)
      end
      [1,2,3,4,5].each do |number|
        @large_set.add(number)
      end
    end

    describe "#union" do
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
    end

    describe "#intersection" do
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

    describe "#difference" do
      it "can find the difference of two non-empty sets" do
        final_set = [1,2]
        new_set = @set_one.difference(@set_two)
        expect(new_set.size).to eq(2)
        final_set.each do |element|
          expect(new_set.contains?(element)).to be true
        end
      end

      it "can find the difference of two empty sets" do
        new_set = @blank_set.difference(@blank_set)
        expect(new_set.size).to eq(0)
      end

      it "can find the difference of a non-empty set and an empty set" do
        final_set = [1,2,3]
        new_set = @set_one.difference(@blank_set)
        expect(new_set.size).to eq(3)
        final_set.each do |element|
          expect(new_set.contains?(element)).to be true
        end
      end

      it "can find the difference of a empty set and a non-empty set" do
        new_set = @blank_set.difference(@set_one)
        expect(new_set.size).to eq(0)
      end
    end

    describe "#subset?" do
      it "can identify subsets" do
        expect(@large_set.subset?(@set_one)).to eq(true)
      end

      it "can identify non-subsets" do
        expect(@set_one.subset?(@large_set)).to eq(false)
      end

      it "can identify blank sets as being subsets of non-empty sets" do
        expect(@set_one.subset?(@blank_set)).to eq(true)
      end

      it "can identify blank sets as being subsets of empty sets" do
        expect(@blank_set.subset?(@blank_set)).to eq(true)
      end
    end

  end


end