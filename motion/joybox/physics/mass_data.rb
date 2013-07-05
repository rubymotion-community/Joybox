Joybox::Physics::MassData = B2DMassData

class B2DMassData

  alias_method :rotational_inertia, :I
  alias_method :rotational_inertia=, :setI
  alias_method :metric_center, :centre
  alias_method :metric_center=, :setCentre

  def center
    metric_center.to_pixel_coordinates
  end

  def center=(center)
    center = center.to_point unless center.is_a? (CGPoint)
    self.metric_center = center.from_pixel_coordinates
  end
  
end