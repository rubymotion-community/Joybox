Joybox::Physics::Body = B2DBody

class B2DBody

  alias_method :world_center, :worldCenter
  alias_method :local_center, :localCenter
  alias_method :linear_velocity, :linearVelocity
  alias_method :angular_velocity, :angularVelocity
  alias_method :mass_data, :massData
  alias_method :linear_damping, :linearDamping
  alias_method :angular_damping, :angularDamping
  alias_method :gravity_scale, :gravityScale
  alias_method :is_bullet, :isBullet
  alias_method :is_awake, :isAwake
  alias_method :is_active, :isActive
  alias_method :is_fixed_rotation, :isFixedRotation
  alias_method :is_sleeping_allowed, :isSleepingAllowed

  Static = 0
  Kinematic = 1
  Dynamic = 2

  def self.defaults
    {
      position: [0, 0],
      angle: 0,
      linear_velocity: [0, 0],
      angular_velocity: 0,
      linear_damping: 0,
      angular_damping: 0,
      allow_sleep: true,
      awake: true,
      fixed_rotation: false,
      bullet: false,
      type: Static,
      active: true,
      gravity_scale: 1.0
    }
  end

  def self.new(world, options = {})
    options = options.nil? ? defaults : defaults.merge!(options)

    # body_definition = B2DBodyDef.new()
    # position = CGPointMake(options[:position][0], options[:position][1])
    # # body_definition.position = position.to_pixel_coordinates
    # #  body_definition.angle = options[:angle]
    # #  body_definition.linearVelocity = CGPointMake(options[:linear_velocity][0], options[:linear_velocity][1])
    # #  body_definition.angularVelocity = options[:angular_velocity]
    # #  body_definition.linearDamping = options[:linear_damping]
    # #  body_definition.angularDamping = options[:angular_damping]
    # #  body_definition.allowSleep = options[:allow_sleep]
    # #  body_definition.awake = options[:awake]
    # #  body_definition.fixedRotation = options[:fixed_rotation]
    # #  body_definition.bullet = options[:bullet]
    # #  body_definition.type = options[:type]
    # #  body_definition.gravityScale = options[:gravity_scale]

    # p 'loooool'
    # p body_definition

    # This line is needed to ensure that the position is a CGPoint
    position2 = CGPointMake(options[:position][0], options[:position][1])
    world.createBodyInPosition(position2.to_pixel_coordinates,
                               type: options[:type])

    #world.createBody(body_definition)
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
