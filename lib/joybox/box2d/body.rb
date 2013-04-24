Joybox::Body = B2DBody

class B2DBody

  def self.defaults
    {
      position: [0, 0],
      type: KStaticBodyType
    }
  end


  def self.new(world, options = {})

    options = options.nil? ? defaults : defaults.merge!(options)

    # This line is needed to ensure that the position is a CGPoint
    position = CGPointMake(options[:position][0], options[:position][1])

    world.createBodyInPosition(position.to_pixel_coordinates,
                               type: options[:type])
  end


  def fixture_defaults
    {
      friction: 0.2,
      restitution: 0,
      density: 0,
      is_sensor: false
    }
  end


  def edge_fixture(*hash)

    options = hash.pop
    options = options.nil? ? fixture_defaults : fixture_defaults.merge!(options)

    # The following lines are needed to ensure that the start_point and 
    # end_points are CGPoints
    start_point = CGPointMake(options[:start_point][0], options[:start_point][1])
    end_point = CGPointMake(options[:end_point][0], options[:end_point][1])

    edge_shape = B2DEdgeShape.alloc.initWithStartPoint(start_point.to_pixel_coordinates,
                                                       endPoint: end_point.to_pixel_coordinates)

    addFixtureForShape(edge_shape,
                       friction: options[:friction],
                       restitution: options[:restitution],
                       density: options[:density],
                       isSensor: options[:is_sensor])
  end


  def polygon_fixture(*hash)

    options = hash.pop
    options = options.nil? ? fixture_defaults : fixture_defaults.merge!(options)

    # This line is needed to ensure that the box is a CGSize
    box_size = CGSizeMake(options[:box][0], options[:box][1])

    polygon_shape = B2DPolygonShape.alloc.initWithBoxSize(box_size.to_pixel_coordinates)

    addFixtureForShape(polygon_shape,
                       friction: options[:friction],
                       restitution: options[:restitution],
                       density: options[:density],
                       isSensor: options[:is_sensor])
  end


  def position=(position)

    # This line is needed to ensure that the position is a CGPoint
    position = CGPointMake(position[0], position[1])

    # Coordinate system conversion
    position = position.to_opengl_coordinates
    position = position.to_pixel_coordinates

    self.setPosition(position)
  end


  def circle_fixture(*hash)
    options = hash.pop
    options = options.nil? ? fixture_defaults : fixture_defaults.merge!(options)

    circle_shape = B2DCircleShape.alloc.initWithRadius(options[:radius].to_pixels)
    addFixtureForShape(circle_shape,
                       friction: options[:friction],
                       restitution: options[:restitution],
                       density: options[:density],
                       isSensor: options[:is_sensor])
  end


  def apply_force_defaults
    {
      location: self.center,
      as_impulse: true
    }
  end


  def apply_force(options = {})

    options = options.nil? ? apply_force_defaults : apply_force_defaults.merge!(options)

    # This line is needed to ensure that the force is a CGPoint
    force = CGPointMake(options[:force][0], options[:force][1])

    applyForce(force.to_pixel_coordinates, 
               atLocation: options[:location], 
               asImpulse: options[:as_impulse]) 
  end


  def apply_torque_defaults
    {
      as_impulse: true
    }
  end


  def apply_torque(options = {})

    options = options.nil? ? apply_torque_defaults : apply_torque_defaults.merge!(options)

    applyTorque(options[:torque], 
               asImpulse: options[:as_impulse]) 
  end
  
end
