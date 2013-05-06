class NSEvent

  def location

    Joybox.director.convertEventToGL(self)
  end
  
end