class UITouch

  # We need a method instead of the alias method because of 
  # the 'Type `{CGPoint=ff}@:@' not precompiled' error
  def location_in_view(view)

    locationInView(view)
  end

  def location

    locationInView(self.view).to_opengl_coordinates
  end

end