Joybox::Physics::EdgeShape = B2DEdgeShape

class B2DEdgeShape

  extend Joybox::Common::Initialize

  alias_method :metric_start_point, :startVertex
  alias_method :metric_end_point, :endVertex
  alias_method :has_start_adjacent_point?, :hasStartAdjacentVertex
  alias_method :metric_start_adjacent_point, :startAdjacentVertex
  alias_method :has_end_adjacent_point?, :hasEndAdjacentVertex
  alias_method :metric_end_adjacent_point, :endAdjacentVertex

  def initialize(options = {})
    start_point = CGPointMake(options[:start_point][0], options[:start_point][1])
    end_point = CGPointMake(options[:end_point][0], options[:end_point][1])

    initWithStartVertex(start_point.from_pixel_coordinates, endVertex: end_point.from_pixel_coordinates)
  end

  def start_point
    self.startVertex.to_pixel_coordinates
  end

  def end_point
    self.endVertex.to_pixel_coordinates
  end

  def start_adjacent_point
    self.startAdjacentVertex.to_pixel_coordinates
  end
  
  def end_adjacent_point
    self.endAdjacentVertex.to_pixel_coordinates
  end

end