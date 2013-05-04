# TODO: Revisar el nombre de estos metodos
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


  def to_pixel_coordinates

    CGSizeMake(self.width.to_pixels, self.height.to_pixels)
  end


  def from_pixel_coordinates

    CGSizeMake(self.width.from_pixels, self.height.from_pixels)
  end
  
end