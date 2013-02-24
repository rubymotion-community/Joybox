class UITouch

  # We need a method instead of the alias method because of 
  # the 'Type `{CGPoint=ff}@:@' not precompiled' error
  def location_in_view(view)

    locationInView(view)
  end

  # TODO: Otra revision de nombrado
  def location_in_touch_view

    locationInView(self.view)
  end

end