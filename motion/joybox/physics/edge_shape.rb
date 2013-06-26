class EdgeShape < B2DEdgeShape

  extend Joybox::Common::Initialize

  def initialize(options = {})
    start_point = CGPointMake(options[:start_point][0], options[:start_point][1])
    end_point = CGPointMake(options[:end_point][0], options[:end_point][1])

    initWithStartVertex(start_point.to_pixel_coordinates, endVertex: end_point.to_pixel_coordinates)
  end

end