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

  def contains_point?(options = {})
    unless [:point, :position, :angle].all? { |k| options.key? k }
      return # Todo print error message on the console
    end

    transform = Transform.new
    transform.position = options[:position]
    transform.angle = options[:angle]
    point = options[:point].to_point unless options[:point].is_a? (CGPoint)

    testPointWithTransform(transform, andPoint: point.from_pixel_coordinates)
  end

  def ray_cast(options = {}, &block)
    unless [:first_point, :second_point, :maximum_fraction, 
            :position, :angle, :child_index].all? { |k| options.key? k }
      return # Todo print error message on the console
    end

    transform = Transform.new
    transform.position = options[:position]
    transform.angle = options[:angle]

    ray_cast_input = RayCastInput.new
    ray_cast_input.first_point = options[:first_point]
    ray_cast_input.second_point = options[:second_point]
    ray_cast_input.maximum_fraction = options[:maximum_fraction]

    ray_cast_output = RayCastOutput.new

    hits = rayCastWithOutput(ray_cast_output, 
                             input: ray_cast_input, 
                             transform: transform, 
                             andChildren: options[:child_index])
    block.call(hits, ray_cast_output.normal, ray_cast_output.fraction)
  end
  
  def compute_aabb(options = {})
    unless [:position, :angle, :child_index].all? { |k| options.key? k }
      return # Todo print error message on the console
    end

    transform = Transform.new
    transform.position = options[:position]
    transform.angle = options[:angle]
    
    aabb = AABB.new
    computeAABB(aabb, withTransform: transform, andChildIndex: options[:child_index])
    aabb
  end

  def compute_mass(options = {})
    unless [:density].all? { |k| options.key? k }
      return # Todo print error message on the console
    end

    mass_data = MassData.new
    computeMass(mass_data, withDensity: options[:density])
    mass_data
  end
end