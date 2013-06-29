Joybox::Physics::RayCastOutput = B2DRayCastOutput

class B2DRayCastOutput

  alias_method :metric_normal, :normal
  alias_method :metric_normal=, :normal=

  def normal
    metric_normal.to_pixel_coordinates
  end

  def normal=(normal)
    normal = normal.to_point unless normal.is_a? (CGPoint)
    self.metric_normal = normal.from_pixel_coordinates
  end

end