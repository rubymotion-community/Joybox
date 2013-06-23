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

    it "should initialize with gravity, and allows sleeping" do
      world = World.new gravity: [10, 10], allows_sleeping: true
      world.should.not == nil
      world.gravity.should == CGPointMake(10, 10)
      world.allows_sleeping?.should == true
    end
  end

  it "should create new bodies" do
    world = World.new gravity: [0, -9.8]
    body = world.new_body position: [100, 100]
    body.should.not == nil
    body.position.should == CGPointMake(3.125, 3.125)
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
    static_body.position.should == CGPointMake(3.125, 3.125)
    dynamic_body = world.new_body position: [100, 100], type: Body::Dynamic
    dynamic_body.position.should == CGPointMake(3.125, 3.125)
    kinematic_body = world.new_body position: [100, 100], type: Body::Kinematic
    kinematic_body.position.should == CGPointMake(3.125, 3.125)

    world.step delta: 100
    static_body.position.should == CGPointMake(3.125, 3.125)
    dynamic_body.position.should.be.close CGPointMake(3.125, 1.125), 0.001
    kinematic_body.position.should == CGPointMake(3.125, 3.125)

    world.step delta: 10, velocity_interactions:10, position_interactions: 2
    static_body.position.should == CGPointMake(3.125, 3.125)
    dynamic_body.position.should.be.close CGPointMake(3.125, -0.875), 0.001
    kinematic_body.position.should == CGPointMake(3.125, 3.125)
  end

  it "should change its gravity" do
    world = World.new gravity: [0, -9.8]

    body = world.new_body position: [100, 100], type: Body::Dynamic
    body.position.should == CGPointMake(3.125, 3.125)

    world.step delta: 10
    body.position.should.be.close CGPointMake(3.125, 1.125), 0.001

    world.gravity = [0, 9.8]
    world.step delta: 10
    body.position.should.be.close CGPointMake(3.125, 3.125), 0.001

    world.destroy_body(body)

    body = world.new_body position: [100, 100], type: Body::Dynamic
    body.position.should == CGPointMake(3.125, 3.125)

    world.gravity = [-9.8, 0]
    world.step delta: 100
    body.position.should.be.close CGPointMake(1.125, 3.125), 0.001

    world.gravity = [9.8, 0]
    world.step delta: 100
    body.position.should.be.close CGPointMake(3.125, 3.125), 0.001
  end

  it "should have a profile" do
    world = World.new gravity: [0, -9.8]

    world.profile.step.should == 0
    world.profile.collide.should == 0
    world.profile.solve.should == 0
    world.profile.solveInit.should == 0
    world.profile.solveVelocity.should == 0
    world.profile.solvePosition.should == 0
    world.profile.broadphase.should == 0
    world.profile.solveTOI.should == 0
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

    #p @body_one.position
    #p @body_two.position


    world.step delta: 10
    world.step delta: 10
    world.step delta: 10
    world.step delta: 10
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

    body.position.should == CGPointMake(3.125, 1.125)
  end

  it "should query the world with a lower bound & upper bound" do
    world = World.new gravity: [0, -9.8]

    body = world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    world.query lower_bound:[0, 0], upper_bound:[1, 1] do |fixture|
      fixture.should.not == nil
      true
    end
  end

  it "should ray cast the world with a first point and second point" do
    world = World.new gravity: [0, -9.8]

    body = world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    world.ray_cast first_point: [0, 0], second_point: [1, 1] do |fixture, point, normal, fraction|
      fixture.should.not == nil
      point.should.be.close CGPointMake(0.08, 0.08), 0.01
      normal.should == CGPointMake(0, -1.0)
      fraction.should.be.close 0.08203125, 0.01
      0.0
    end
  end
end