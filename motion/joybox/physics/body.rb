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
  alias_method :reset_mass, :resetMassData
  alias_method :fixtures, :fixtureList
  alias_method :destroy_fixture, :destroyFixture
  alias_method :metric_position, :position
  alias_method :radian_angle, :angle

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
    body_definition.position = position.from_pixel_coordinates
    body_definition.angle = options[:angle]
    linear_velocity = CGPointMake(options[:linear_velocity][0], options[:linear_velocity][1])
    body_definition.linearVelocity = linear_velocity.from_pixel_coordinates
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

    body = world.createBody(body_definition)
    body.userData = Hash.new
    body
  end

  def ==(body)
    body.is_a?(self.class) && self.isEqualToBody(body)
  end 

  def position
    metric_position.to_pixel_coordinates
  end

  def position=(position)
    position = CGPointMake(position[0], position[1])
    position = position.from_pixel_coordinates
    self.setTransformWithPosition(position, andAngle: radian_angle)
  end

  def angle
    radian_angle.from_radians * -1
  end

  def angle=(angle)
    self.setTransformWithPosition(metric_position, andAngle: angle.to_radians * -1)
  end

  def to_world_point(local_point)
    local_point = local_point.to_point.from_pixel_coordinates
    worldPoint(local_point).to_pixel_coordinates
  end

  def to_world_vector(local_vector)
    local_vector = local_vector.to_point.from_pixel_coordinates
    worldVector(local_vector).to_pixel_coordinates
  end

  def to_local_point(world_point)
    world_point = world_point.to_point.from_pixel_coordinates
    localPoint(world_point).to_pixel_coordinates
  end

  def to_local_vector(world_vector)
    world_vector = world_vector.to_point.from_pixel_coordinates
    localVector(world_vector).to_pixel_coordinates
  end

  def linear_velocity_at(options = {})
    point = options[:local_point] if options.has_key? :local_point
    point = options[:world_point] if options.has_key? :world_point
    point = point.to_point.from_pixel_coordinates

    return linearVelocityFromLocalPoint(point) if options.has_key? :local_point
    return linearVelocityFromWorldPoint(point) if options.has_key? :world_point
  end

  def [](key)
    self.userData[key]
  end

  def []=(key, value)
    self.userData[key] = value
  end 

  def new_fixture(&block)
    instance_eval(&block) if block
  end

  def fixture(options = {})
    add_fixture(options, options[:shape])
  end

  def edge_fixture(options = {})
    edge_shape = B2DEdgeShape.new(options)
    add_fixture(options, edge_shape)
  end

  def polygon_fixture(options = {})
    polygon_shape = B2DPolygonShape.new(options)
    add_fixture(options, polygon_shape)
  end

  def circle_fixture(options = {})
    circle_shape = B2DCircleShape.new(options)
    add_fixture(options, circle_shape)
  end

  def chain_fixture(options = {})
    chain_shape = B2DChainShape.new(options)
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
    force = CGPointMake(options[:force][0], options[:force][1]).from_pixel_coordinates

    if options.has_key? :location
      location = CGPointMake(options[:location][0], options[:location][1])
      location = location.from_pixel_coordinates
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

    applyTorque(options[:torque]) unless options[:as_impulse]
    applyAngularImpulse(options[:torque]) if options[:as_impulse]
  end
  
end