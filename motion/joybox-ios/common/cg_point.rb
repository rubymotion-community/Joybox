class CGPoint

  def to_opengl_coordinates

    Joybox.director.convertToGL(self)
  end


  def from_opengl_coordinates

    Joybox.director.convertToUI(self)
  end


  def to_pixel_coordinates

    CGPointMake(self.x.to_pixels, self.y.to_pixels)
  end


  def from_pixel_coordinates

    CGPointMake(self.x.from_pixels, self.y.from_pixels)
  end


  def == (point)

    point.is_a?(CGPoint) && CGPointEqualToPoint(self, point)
  end 


  def + (point)

    CGPointMake(self.x + point.x, self.y + point.y)
  end


  def - (point)

    CGPointMake(self.x - point.x, self.y - point.y)
  end

end