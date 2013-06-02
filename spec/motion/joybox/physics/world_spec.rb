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
      world.allowsSleeping == true
    end

    it "should initialize with gravity, allows sleeping and continuous physics" do
      world = World.new gravity: [10, 10], allows_sleeping: true, continuous_physics: true
      world.should.not == nil
      world.gravity.should == CGPointMake(10, 10)
      world.allowsSleeping == true
      world.continuousPhysics == true
    end
  end

  it "should create new bodies" do
    world = World.new gravity: [0, -9.8]
    body = world.new_body position: [100, 100]
    body.should.not == nil
    body.position.should == CGPointMake(3.125, 3.125)
  end

  it "should remove bodies" do
    world = World.new gravity: [0, -9.8]
    body = world.new_body position: [100, 100]
    body.should.not == nil
    body.position.should == CGPointMake(3.125, 3.125)

    world.removeBody(body)
  end

  it "should step into the simulation" do
    world = World.new gravity: [0, -9.8]

    static_body = world.new_body position: [100, 100]
    static_body.position.should == CGPointMake(3.125, 3.125)
    dynamic_body = world.new_body position: [100, 100], type: KDynamicBodyType
    dynamic_body.position.should == CGPointMake(3.125, 3.125)
    kinematic_body = world.new_body position: [100, 100], type: KKinematicBodyType
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

    body = world.new_body position: [100, 100], type: KDynamicBodyType
    body.position.should == CGPointMake(3.125, 3.125)

    world.step delta: 10
    body.position.should.be.close CGPointMake(3.125, 1.125), 0.001

    world.gravity = [0, 9.8]
    world.step delta: 10
    body.position.should.be.close CGPointMake(3.125, 3.125), 0.001

    world.removeBody(body)

    body = world.new_body position: [100, 100], type: KDynamicBodyType
    body.position.should == CGPointMake(3.125, 3.125)

    world.gravity = [-9.8, 0]
    world.step delta: 100
    body.position.should.be.close CGPointMake(1.125, 3.125), 0.001

    world.gravity = [9.8, 0]
    world.step delta: 100
    body.position.should.be.close CGPointMake(3.125, 3.125), 0.001
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
end