class NSString

  def to_color
    Joybox::Common::Color.from_hex(self)
  end
  
end