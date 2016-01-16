class OutOFBoundsException < RuntimeError
end

class FixedArray
  def initialize(size)
    @size = size
    size.times do |index|
      self.instance_variable_set(:"@index#{index}", nil)
    end
  end

  def get(index)
    if instance_variable_defined?(:"@index#{index}")
      self.instance_variable_get("@index#{index}")
    else
      raise OutOFBoundsException
    end
  end

  def set(index, value)
    self.instance_variable_set(:"@index#{index}", value)
    value
  end

end