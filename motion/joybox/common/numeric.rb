class Numeric

  def half
    self / 2
  end

  def to_pixels
    self * 32.0
  end

  def from_pixels
    self / 32.0
  end

  def to_radians
    self * (Math::PI / 180) 
  end

  def from_radians
    self * (180 / Math::PI)
  end

end