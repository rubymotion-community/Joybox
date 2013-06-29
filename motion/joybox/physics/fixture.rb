Joybox::Physics::Fixture = B2DFixture

class B2DFixture

  alias_method :sensor?, :isSensor
  alias_method :mass_data, :massData
  alias_method :metric_aabb, :aabb

  Circle = 0
  Edge = 1
  Polygon = 2
  Chain = 3
  Count = 4 

  def filter_data
    filterData
  end

  def filter_data=(filter_data)
    setFilterData(filter_data)
  end

  def contains_point?(point)
    point = point.to_point.from_pixel_coordinates
    testPoint(point)
  end

  def aabb(options = {})
    unless [:child_index].all? { |k| options.key? k }
      return # Todo print error message on the console
    end

    metric_aabb(options[:child_index])
  end

  def ray_cast(options = {}, &block)
    unless [:first_point, :second_point, :maximum_fraction, :child_index].all? { |k| options.key? k }
      return # Todo print error message on the console
    end

    ray_cast_input = RayCastInput.new
    ray_cast_input.first_point = options[:first_point]
    ray_cast_input.second_point = options[:second_point]
    ray_cast_input.maximum_fraction = options[:maximum_fraction]

    ray_cast_output = Pointer.new(RayCastOutput.type)

    hits = rayCastWithOutput(ray_cast_output, input:ray_cast_input, andChildIndex: options[:child_index])
    block.call(hits, ray_cast_output[0].normal, ray_cast_output[0].fraction)
  end
  
end