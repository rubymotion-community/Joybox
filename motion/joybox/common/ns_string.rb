class NSString

  def to_color
    Color.from_hex(self)
  end
  
end