describe Joybox::Physics::World do
  describe "Initialization" do
    it "should initialize with gravity" do
      world = World.new gravity: [10, 10]
      world.should.not == nil
      world.gravity.should == CGPointMake(10, 10)
    end

    it "should initialize with gravity and allows_sleeping" do
      world = World.new gravity: [10, 10], allows_sleeping: true
      world.should.not == nil
      world.gravity.should == CGPointMake(10, 10)
      world.allows_sleeping?.should == true
    end
  end

  it "should auto clear forces" do
    world = World.new gravity: [10, 10], allows_sleeping: true
    world.should.not == nil
    world.auto_clear_forces = true
    world.auto_clear_forces?.should == true
  end

  it "should create new bodies" do
    world = World.new gravity: [0, -9.8]
    body = world.new_body position: [100, 100]
    body.should.not == nil
    body.position.should == CGPointMake(100, 100)
    world.bodies.size.should == 1
  end

  it "should destroy bodies" do
    world = World.new gravity: [0, -9.8]
    body = world.new_body position: [100, 100]
    body.should.not == nil
    
    world.destroy_body(body)
    world.bodies.size.should == 0
  end

  it "should step into the simulation" do
    world = World.new gravity: [0, -9.8]

    static_body = world.new_body position: [100, 100]
    static_body.position.should == CGPointMake(100, 100)
    dynamic_body = world.new_body position: [100, 100], type: Body::Dynamic
    dynamic_body.position.should == CGPointMake(100, 100)
    kinematic_body = world.new_body position: [100, 100], type: Body::Kinematic
    kinematic_body.position.should == CGPointMake(100, 100)

    world.step delta: 100
    static_body.position.should == CGPointMake(100, 100)
    dynamic_body.position.should.be.close CGPointMake(100, 36), 0.001
    kinematic_body.position.should == CGPointMake(100, 100)

    world.step delta: 10, velocity_interactions:10, position_interactions: 2
    static_body.position.should == CGPointMake(100, 100)
    dynamic_body.position.should.be.close CGPointMake(100, -28.0), 0.001
    kinematic_body.position.should == CGPointMake(100, 100)
  end

  it "should change its gravity" do
    world = World.new gravity: [0, -9.8]

    body = world.new_body position: [100, 100], type: Body::Dynamic
    body.position.should == CGPointMake(100, 100)

    world.step delta: 10
    body.position.should.be.close CGPointMake(100, 36), 0.001

    world.gravity = [0, 9.8]
    world.step delta: 10
    body.position.should.be.close CGPointMake(100, 100), 0.001

    world.destroy_body(body)

    body = world.new_body position: [100, 100], type: Body::Dynamic
    body.position.should == CGPointMake(100, 100)

    world.gravity = [-9.8, 0]
    world.step delta: 100
    body.position.should.be.close CGPointMake(36, 100), 0.001

    world.gravity = [9.8, 0]
    world.step delta: 100
    body.position.should.be.close CGPointMake(100, 100), 0.001
  end

  it "should have a profile" do
    world = World.new gravity: [0, -9.8]

    world.profile.step.should == 0
    world.profile.collide.should == 0
    world.profile.solve.should == 0
    world.profile.solve_init.should == 0
    world.profile.solve_velocity.should == 0
    world.profile.solve_position.should == 0
    world.profile.broadphase.should == 0
    world.profile.solve_TOI.should == 0
  end

  it "should filter body collisions" do
    world = World.new gravity: [0, -9.8]

    first_body = world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    second_body = world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    collision_filter_notified = false

    world.should_collide do |first_fixture, second_fixture|
      collision_filter_notified = true
      first_fixture.should.not == nil
      second_fixture.should.not == nil
      first_fixture.body.should.not == nil
      second_fixture.body.should.not == nil
      true
    end

    world.step delta: 10
    collision_filter_notified.should == true
  end

  it "should notify body collisions" do
    world = World.new gravity: [0, -9.8]

    body_one = world.new_body position: [100, 100], type: KDynamicBodyType do
      polygon_fixture box: [16, 16]
    end

    body_two = world.new_body position: [100, 100], type: KDynamicBodyType do
      polygon_fixture box: [16, 16]
    end

    collision_notified = false

    world.when_collide body_one do |collision_body, is_touching|
      collision_notified = true
      collision_body.should == body_two
      is_touching.should == true
    end

    world.step delta: 10
    collision_notified.should == true
  end

  it "should notify fixture destructions" do
    world = World.new gravity: [0, -9.8]

    body = world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    fixture_destroyed_notified = false

    world.when_fixture_destroyed do |fixture|
      fixture_destroyed_notified = true
      fixture.should.not == nil
    end

    world.destroy_body(body)
    fixture_destroyed_notified.should == true
  end

  it "should clear forces" do
    world = World.new gravity: [0, -9.8]

    body = world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    body.applyForceToCenter([10, 0])
    world.clearForces
    world.step delta: 10

    body.position.should.be.close CGPointMake(100, 36), 0.1
  end

  it "should query the world with a lower bound & upper bound" do
    world = World.new gravity: [0, -9.8]

    body = world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    query_notified = false

    world.query lower_bound:[0, 0], upper_bound:[100, 100] do |fixture|
      query_notified = true
      fixture.should.not == nil
      true
    end

    query_notified.should == true
  end

  it "should ray cast the world with a first point and second point" do
    world = World.new gravity: [0, -9.8]

    body = world.new_body position: [320, 320], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    ray_cast_notified = false

    world.ray_cast first_point: [0, 0], second_point: [320, 320] do |fixture, point, normal, fraction|
      ray_cast_notified = true
      fixture.type.should == Fixture::PolygonType
      point.should.be.close CGPointMake(0.29, 0.29), 0.01
      normal.should == CGPointMake(0, -1.0)
      fraction.should.be.close 0.94, 0.01
      0.0
    end

    ray_cast_notified.should == true
  end
end