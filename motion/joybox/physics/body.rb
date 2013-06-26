Joybox::Physics::Body = B2DBody

class B2DBody

  alias_method :world_center, :worldCenter
  alias_method :local_center, :localCenter
  alias_method :linear_velocity, :linearVelocity
  alias_method :linear_velocity=, :setLinearVelocity
  alias_method :angular_velocity, :angularVelocity
  alias_method :angular_velocity=, :setAngularVelocity
  alias_method :linear_damping, :linearDamping
  alias_method :linear_damping=, :setLinearDamping
  alias_method :angular_damping, :angularDamping
  alias_method :angular_damping=, :setAngularDamping
  alias_method :gravity_scale, :gravityScale
  alias_method :gravity_scale=, :setGravityScale
  alias_method :bullet?, :isBullet
  alias_method :bullet=, :setBullet
  alias_method :awake?, :isAwake
  alias_method :awake=, :setAwake
  alias_method :active?, :isActive
  alias_method :fixed_rotation?, :isFixedRotation
  alias_method :fixed_rotation=, :setFixedRotation
  alias_method :sleeping_allowed?, :isSleepingAllowed
  alias_method :sleeping_allowed=, :setSleepingAllowed

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

  def mass_data
    massData
  end

  def mass_data=(mass_data)
    setMassData(mass_data)
  end

  def self.new(world, options = {})
    options = options.nil? ? defaults : defaults.merge!(options)

    body_definition = B2DBodyDef.new()
    position = CGPointMake(options[:position][0], options[:position][1])
    body_definition.position = position.to_pixel_coordinates
    body_definition.angle = options[:angle]
    linear_velocity = CGPointMake(options[:linear_velocity][0], options[:linear_velocity][1])
    body_definition.linearVelocity = linear_velocity.to_pixel_coordinates
    body_definition.angularVelocity = options[:angular_velocity]
    body_definition.linearDamping = options[:linear_damping]
    body_definition.angularDamping = options[:angular_damping]
    body_definition.allowSleep = options[:allow_sleep]
    body_definition.awake = options[:awake]
    body_definition.fixedRotation = options[:fixed_rotation]
    body_definition.bullet = options[:bullet]
    body_definition.type = options[:type]
    body_definition.active = options[:active]
    body_definition.gravityScale = options[:gravity_scale]

    world.createBody(body_definition)
  end

  def == (body)
    body.is_a?(self.class) && self.isEqualToBody(body)
  end 

  def position=(position)
    position = CGPointMake(position[0], position[1])
    position = position.to_pixel_coordinates
    self.setTransformWithPosition(position, andAngle: angle)
  end

  def angle=(angle)
    self.setTransformWithPosition(position, andAngle: angle)
  end

  def edge_fixture(options = {})
    edge_shape = EdgeShape.new(options)
    add_fixture(options, edge_shape)
  end

  def polygon_fixture(options = {})
    polygon_shape = PolygonShape.new(options)
    add_fixture(options, polygon_shape)
  end

  def circle_fixture(options = {})
    circle_shape = CircleShape.new(options)
    add_fixture(options, circle_shape)
  end

  def chain_fixture(options = {})
    chain_shape = ChainShape.new(options)
    add_fixture(options, chain_shape)
  end

  def add_fixture_defaults
    {
      friction: 0.2,
      restitution: 0,
      density: 0,
      is_sensor: false
    }
  end

  def add_fixture(options = {}, shape)
    options = options.nil? ? add_fixture_defaults : add_fixture_defaults.merge!(options)

    fixture_definition = B2DFixtureDef.new
    fixture_definition.shape = shape;
    fixture_definition.friction = options[:friction];
    fixture_definition.restitution = options[:friction];
    fixture_definition.density = options[:density];
    fixture_definition.isSensor = options[:is_sensor];

    createFixture(fixture_definition)
  end

  def apply_force_defaults
    {
      as_impulse: true
    }
  end

  def apply_force(options = {})
    options = options.nil? ? apply_force_defaults : apply_force_defaults.merge!(options)
    force = CGPointMake(options[:force][0], options[:force][1]).to_pixel_coordinates

    if options.has_key? :location
      location = CGPointMake(options[:location][0], options[:location][1])
      location = location.to_pixel_coordinates
    else
      location = local_center
    end

    applyLinearImpulse(force, atPoint: location) if options[:as_impulse]
    applyForce(force, atPoint: location) unless options[:as_impulse]
  end

  def apply_torque_defaults
    {
      as_impulse: true
    }
  end

  def apply_torque(options = {})
    options = options.nil? ? apply_torque_defaults : apply_torque_defaults.merge!(options)

    apply_torque(options[:torque]) unless options[:as_impulse]
    applyAngularImpulse(options[:torque]) if options[:as_impulse]
  end
  
end
