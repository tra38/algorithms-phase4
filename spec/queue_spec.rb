require_relative '../queue.rb'
require 'pry'

RSpec.describe "MyQueue" do
  before(:each) do
    @queue = MyQueue.new
  end

  it "should have no value when initialized" do
    expect(@queue.peel).to eq(nil)
  end

  it "can enqueue an element into the queue" do
    @queue.enqueue("empire")
    expect(@queue.peel).to eq("empire")
  end

  describe "#dequeue" do

    it "can dequeue an element from the queue" do
      @queue.enqueue("empire")
      expect(@queue.dequeue).to eq("empire")
      binding.pry
      expect(@queue.peel).to eq(nil)
    end

    it "can dequeue from an empty queue" do
      expect(@queue.dequeue).to eq(nil)
    end

    it "should handle queues longer than one element" do
      @queue.enqueue("empire")
      @queue.enqueue("federation")
      expect(@queue.dequeue).to eq("empire")
      expect(@queue.peel).to eq("federation")
    end
  end

  describe "empty?" do
    it "should return true if empty" do
      expect(@queue.empty?).to be(true)
    end

    it "should return false if not empty" do
      @queue.enqueue("empire")
      expect(@queue.empty?).to be(false)
    end
  end


end


# - `Queue#new()`: Instantiate a new `Queue`
# - `Queue#enqueue(element)`: Add a new element to the queue
# - `Queue#dequeue`: Remove and return the first element in the queue
# - `Queue#peel`: Return (but do not remove) the first element in the queue
# - `Queue#empty?`: Answer whether or not the queue is empty