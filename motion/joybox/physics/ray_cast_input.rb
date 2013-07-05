Joybox::Physics::RayCastInput = B2DRayCastInput

class B2DRayCastInput

  alias_method :metric_first_point, :point1
  alias_method :metric_first_point=, :setPoint1
  alias_method :metric_second_point, :point2
  alias_method :metric_second_point=, :setPoint2
  alias_method :maximum_fraction, :maxFraction
  alias_method :maximum_fraction=, :setMaxFraction

  def first_point
    metric_first_point.to_pixel_coordinates
  end

  def first_point=(point)
    point = point.to_point unless point.is_a? (CGPoint)
    self.metric_first_point = point.from_pixel_coordinates
  end

  def second_point
    metric_second_point.to_pixel_coordinates
  end

  def second_point=(point)
    point = point.to_point unless point.is_a? (CGPoint)
    self.metric_second_point = point.from_pixel_coordinates
  end
  
end