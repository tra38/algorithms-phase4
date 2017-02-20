class FixedArray
  attr_reader :size

  def initialize(size)
    @size = size
    size.times do |index|
      set(index, nil)
    end
  end

  def get(index)
    instance_variable_get(name(index))
  end

  def set(index, value)
    instance_variable_set(name(index), value)
  end

  private
  def name(index)
    raise IndexError unless (0...size).include?(index)
    "@index#{index}"
  end

end