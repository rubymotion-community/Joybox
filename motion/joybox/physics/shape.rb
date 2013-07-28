Joybox::Physics::Shape = B2DMassData

class B2DShape

  alias_method :child_count, :childCount
  alias_method :metric_radius, :radius

  CircleType = 0
  EdgeType = 1
  PolygonType = 2
  ChainType = 3
  CountType = 4 

  def radius
    metric_radius.to_pixels
  end

  def contains_point?(point)
    point = point.to_point unless point.is_a? (CGPoint)
    testPointWithTransform(Transform.new, andPoint: point.from_pixel_coordinates)
  end

  def ray_cast(options = {}, &block)
    unless [:first_point, :second_point, :maximum_fraction, :child_index].all? { |k| options.has_key? k }
      return # Todo print error message on the console
    end

    ray_cast_input = RayCastInput.new
    ray_cast_input.first_point = options[:first_point]
    ray_cast_input.second_point = options[:second_point]
    ray_cast_input.maximum_fraction = options[:maximum_fraction]

    ray_cast_output = RayCastOutput.new

    hits = rayCastWithOutput(ray_cast_output, 
                             input: ray_cast_input, 
                             transform: Transform.new, 
                             andChildren: options[:child_index])
    block.call(hits, ray_cast_output.normal, ray_cast_output.fraction)
  end
  
  def compute_aabb(options = {})
    unless options.has_key? :child_index
      return # Todo print error message on the console
    end
    
    aabb = AABB.new
    computeAABB(aabb, withTransform: Transform.new, andChildIndex: options[:child_index])
    aabb
  end

  def compute_mass(options = {})
    unless options.has_key? :density
      return # Todo print error message on the console
    end

    mass_data = MassData.new
    computeMass(mass_data, withDensity: options[:density])
    mass_data
  end
end