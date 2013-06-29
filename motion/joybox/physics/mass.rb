Joybox::Physics::MassData = B2DMassData

class B2DMassData
  alias_method :rotational_inertia, :rotationalInertia
  alias_method :rotational_inertia=, :rotationalInertia=
  alias_method :metric_center, :center
  alias_method :metric_center=, :center=

  def center
    self.metric_center.to_pixel_coordinates
  end

  def center=(center)
    center = center.to_point unless center.is_a? (CGPoint)
    self.metric_center = center.from_pixel_coordinates
  end
end