class CGSize

  def half_width
    width / 2
  end

  def double_width
    width * 2
  end

  def half_height
    height / 2
  end

  def double_height
    height * 2
  end

  def from_pixel_coordinates
    CGSizeMake(self.width.from_pixels, self.height.from_pixels)
  end

  def to_pixel_coordinates
    CGSizeMake(self.width.to_pixels, self.height.to_pixels)
  end

  def half
    self / 2
  end

  def /(other)
    case other
    when Numeric
      return CGSizeMake(self.width / other, self.height / other)
    when CGSizeMake
      return CGSizeMake(self.width / other.width, self.height / other.height)
    end
  end
  
end