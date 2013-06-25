describe Joybox::Physics::Body do
  before do
    @world = World.new gravity: [0, -9.8]
  end

  describe "Initialization" do
    it "should initialize with position" do
      body = @world.new_body position:[100, 100]
      body.should.not == nil
      body.position.should == CGPointMake(3.125, 3.125)
    end

    it "should initialize with position and type" do
      static_body = @world.new_body position: [100, 100]
      static_body.should.not == nil
      static_body.position.should == CGPointMake(3.125, 3.125)

      dynamic_body = @world.new_body position: [100, 100], type: Body::Dynamic
      dynamic_body.should.not == nil
      dynamic_body.position.should == CGPointMake(3.125, 3.125)

      kinematic_body = @world.new_body position: [100, 100], type: Body::Kinematic
      kinematic_body.should.not == nil
      kinematic_body.position.should == CGPointMake(3.125, 3.125)
    end

    it "should initialize with position and edge fixture" do
      body = @world.new_body position:  [100, 100] do
        edge_fixture start_point: [0, 480],
                    end_point: [320, 480],
        friction: 1,
        restitution: 2,
        density: 3,
        is_sensor: true
      end

      body.should.not == nil
      body.position.should == CGPointMake(3.125, 3.125)
    end

    it "should initialize with position and polygon fixture" do
      body = @world.new_body position:  [100, 100] do
        polygon_fixture box: [16, 16],
        friction: 1,
        restitution: 2,
        density: 3,
        is_sensor: true
      end

      body.should.not == nil
      body.position.should == CGPointMake(3.125, 3.125)
    end

    it "should initialize with position and circle fixture" do
      body = @world.new_body position:  [100, 100] do
        circle_fixture radius: 30,
        friction: 1,
        restitution: 2,
        density: 3,
        is_sensor: true
      end

      body.should.not == nil
      body.position.should == CGPointMake(3.125, 3.125)
    end
  end

  it "should change its position" do
    static_body = @world.new_body position: [100, 100] do
      polygon_fixture box: [16, 16]
    end

    dynamic_body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    kinematic_body = @world.new_body position: [100, 100], type: Body::Kinematic do
      polygon_fixture box: [16, 16]
    end

    static_body.position.should == CGPointMake(3.125, 3.125)
    dynamic_body.position.should == CGPointMake(3.125, 3.125)
    kinematic_body.position.should == CGPointMake(3.125, 3.125)

    @world.step delta: 10

    static_body.position = [200, 200]
    static_body.position.should == CGPointMake(6.25, 6.25)
    dynamic_body.position = [200, 200]
    dynamic_body.position.should.be.close CGPointMake(6.25, 6.25), 0.01
    kinematic_body.position = [200, 200]
    kinematic_body.position.should == CGPointMake(6.25, 6.25)
    
    @world.step delta: 10

    static_body.position.should == CGPointMake(6.25, 6.25)
    dynamic_body.position.should.be.close CGPointMake(6.25, 6.21), 0.01
    kinematic_body.position.should == CGPointMake(6.25, 6.25)    
  end

  it "should change its angle" do
    static_body = @world.new_body position: [100, 100] do
      polygon_fixture box: [16, 16]
    end

    dynamic_body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    kinematic_body = @world.new_body position: [100, 100], type: Body::Kinematic do
      polygon_fixture box: [16, 16]
    end

    static_body.angle.should == 0
    dynamic_body.angle.should == 0
    kinematic_body.angle.should == 0

    @world.step delta: 10

    static_body.angle = 10
    static_body.angle.should == 10
    dynamic_body.angle = 10
    dynamic_body.angle.should == 10
    kinematic_body.angle = 10
    kinematic_body.angle.should == 10
    
    @world.step delta: 10

    static_body.angle.should == 10
    dynamic_body.angle.should == 10
    kinematic_body.angle.should == 10    
  end

  it "should have mass data" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    body.mass_data.mass.should == 1.0
    body.mass_data.center.should == CGPointMake(0, 0)
    body.mass_data.rotationalInertia == 0.0
  end 

  it "should change its mass data" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    mass_data = B2DMassData.new
    mass_data.mass = 2.0
    mass_data.center = [0.0, 0.0]
    mass_data.rotationalInertia = 1.0

    body.mass_data = mass_data

    body.mass_data.mass.should == 2.0
    body.mass_data.center.should == CGPointMake(0.0, 0.0)
    body.mass_data.rotationalInertia == 1.0
  end

  it "should change its linear velocity" do
    static_body = @world.new_body position: [100, 100] do
      polygon_fixture box: [16, 16]
    end

    dynamic_body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    kinematic_body = @world.new_body position: [100, 100], type: Body::Kinematic do
      polygon_fixture box: [16, 16]
    end

    static_body.position.should == CGPointMake(3.125, 3.125)
    dynamic_body.position.should == CGPointMake(3.125, 3.125)
    kinematic_body.position.should == CGPointMake(3.125, 3.125)

    static_body.linear_velocity = [10, 10]
    static_body.linear_velocity.should == CGPointMake(0, 0)
    dynamic_body.linear_velocity = [10, 10]
    dynamic_body.linear_velocity.should == CGPointMake(10, 10)
    kinematic_body.linear_velocity = [10, 10]
    kinematic_body.linear_velocity.should == CGPointMake(10, 10)

    @world.step delta: 10

    static_body.position.should == CGPointMake(3.125, 3.125)
    dynamic_body.position.should.be.close CGPointMake(5.125, 3.125), 0.01
    kinematic_body.position.should.be.close CGPointMake(4.53, 4.53), 0.01   
  end

  it "should change its angular velocity" do
    static_body = @world.new_body position: [100, 100] do
      polygon_fixture box: [16, 16]
    end

    dynamic_body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    kinematic_body = @world.new_body position: [100, 100], type: Body::Kinematic do
      polygon_fixture box: [16, 16]
    end

    static_body.position.should == CGPointMake(3.125, 3.125)
    dynamic_body.position.should == CGPointMake(3.125, 3.125)
    kinematic_body.position.should == CGPointMake(3.125, 3.125)

    static_body.angular_velocity = 10.0
    static_body.angular_velocity.should == 0
    dynamic_body.angular_velocity = 10.0
    dynamic_body.angular_velocity.should == 10.0
    kinematic_body.angular_velocity = 10.0
    kinematic_body.angular_velocity.should == 10

    @world.step delta: 10

    static_body.position.should == CGPointMake(3.125, 3.125)
    dynamic_body.position.should.be.close CGPointMake(2.76, 1.125), 0.01
    kinematic_body.position.should == CGPointMake(3.125, 3.125)   
  end

  it "should react to force applied as impulse" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    body.position.should == CGPointMake(3.125, 3.125)

    @world.step delta: 10
    body.position.should == CGPointMake(3.125, 1.125)

    body.apply_force force: [1000, 1000]

    @world.step delta: 10
    body.position.should.be.close CGPointMake(3.970, -0.687), 0.001

    @world.step delta: 100
    body.position.should.be.close CGPointMake(3.971, -2.687), 0.001
  end

  it "should react to force applied instantaneously" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    body.position.should == CGPointMake(3.125, 3.125)

    @world.step delta: 10
    body.position.should == CGPointMake(3.125, 1.125)

    body.apply_force force: [1000, 1000], as_impulse: false

    @world.step delta: 10
    body.position.should.be.close CGPointMake(4.7744, 2.2561), 0.0001

    @world.step delta: 100
    body.position.should.be.close CGPointMake(4.7747, 0.2561), 0.0001
  end
end