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

    addFixureForShape(edge_shape,
                      friction: options[:friction],
                      restitution: options[:restitution],
                      density: options[:density],
                      isSensor: options[:is_sensor])
  end


  def polygon_fixure(*hash)

    options = hash.pop
    options = options.nil? ? fixure_defaults : fixure_defaults.merge!(options)

    polygon_shape = B2DPolygonShape.alloc.initWithBoxSize(options[:box])

    addFixureForShape(polygon_shape,
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

    applyForce(options[:force], 
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