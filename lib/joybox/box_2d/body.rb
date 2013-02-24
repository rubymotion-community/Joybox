Joybox::Box2D::Body = B2DBody

class B2DBody

  def self.defaults
    {
      position: [0, 0],
      type: KStaticBodyType
    }
  end


  def self.new(world, options = {})

    options = options.nil? ? defaults : defaults.merge!(options)

    world.createBodyInPosition(options[:position],
                               type: options[:type])
  end


  def fixure_defaults
    {
      friction: 0.2,
      restitution: 0,
      density: 0,
      is_sensor: false
    }
  end


  def edge_fixure(*hash)

    options = hash.pop
    options = options.nil? ? fixure_defaults : fixure_defaults.merge!(options)

    edge_shape = B2DEdgeShape.alloc.initWithStartPoint(options[:start_point],
                                                       endPoint: options[:end_point])

    addFixureForEdgeShape(edge_shape,
                          friction: options[:friction],
                          restitution: options[:restitution],
                          density: options[:density],
                          isSensor: options[:is_sensor])
  end


  def polygon_fixure(*hash)

    options = hash.pop
    options = options.nil? ? fixure_defaults : fixure_defaults.merge!(options)

    polygon_shape = B2DPolygonShape.alloc.initWithBoxSize(options[:box])

    addFixureForPolygonShape(polygon_shape,
                             friction: options[:friction],
                             restitution: options[:restitution],
                             density: options[:density],
                             isSensor: options[:is_sensor])
  end

end