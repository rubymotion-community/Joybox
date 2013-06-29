Joybox::Physics::AABB = B2DAABB

class B2DAABB
  
  alias_method :metric_lower_bound, :lowerBound
  alias_method :metric_lower_bound=, :lowerBound=
  alias_method :metric_upper_bound, :upperBound
  alias_method :metric_upper_bound=, :upperBound=

  def lower_bound
    lowerBound.to_pixel_coordinates
  end

  def lower_bound=(bound)
    bound = bound.to_point unless bound.is_a? (CGPoint)
    self.lowerBound = bound.from_pixel_coordinates
  end

  def upper_bound
    upperBound.to_pixel_coordinates
  end

  def upper_bound=(bound)
    bound = bound.to_point unless bound.is_a? (CGPoint)
    self.upperBound = bound.from_pixel_coordinates
  end

end