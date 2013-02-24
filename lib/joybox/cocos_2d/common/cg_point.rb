class CGPoint

  def to_opengl_coordinates

    Joybox::Cocos2D.director.convertToGL(self)
  end

  #TODO: Estos dos metodos estan en relacion a los de Numeric
  def to_coordinates

    CGPointMake(self.x.to_coordinates, self.y.to_coordinates)
  end


  def to_pixel_coordinates

    CGPointMake(self.x.to_pixels, self.y.to_pixels)
  end


  def == (point)

    point.is_a?(CGPoint) && CGPointEqualToPoint(self, point)
  end 


  def + (point)

    CGPointMake(self.x + point.x, self.y + point.y)
  end

end