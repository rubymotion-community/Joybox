# We need this class to help the framework recognize 
# CGPointMake
CGPoint = ATSPoint

class ATSPoint

  def coerce(other)
    [self, other]
  end

  def to_opengl_coordinates
    Joybox.director.convertToGL(self)
  end

  def from_opengl_coordinates
    Joybox.director.convertToUI(self)
  end

  def from_pixel_coordinates
    CGPointMake(self.x.from_pixels, self.y.from_pixels)
  end

  def to_pixel_coordinates
    CGPointMake(self.x.to_pixels, self.y.to_pixels)
  end

  def == (point)
    point.is_a?(ATSPoint) && CGPointEqualToPoint(self, point)
  end 

  def +(other)
    case other
    when Numeric
      return CGPointMake(self.x + other, self.y + other)
    when ATSPoint || CGPoint
      return CGPointMake(self.x + other.x, self.y + other.y)
    end
  end

  def -(other)
    self.+(-other)
  end

  def *(other)
    case other
    when Numeric
      return CGPointMake(self.x * other, self.y * other)
    when ATSPoint || CGPoint
      return CGPointMake(self.x * other.x, self.y * other.y)
    end
  end

end