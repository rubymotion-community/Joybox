class Numeric

  def from_pixels
    self / 32.0
  end

  def to_pixels
    self * 32.0
  end

end