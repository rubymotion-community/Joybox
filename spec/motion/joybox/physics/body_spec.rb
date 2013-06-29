describe Joybox::Physics::Body do
  before do
    @world = World.new gravity: [0, -9.8]
  end

  describe "Initialization" do
    it "should initialize with position" do
      body = @world.new_body position:[100, 100]
      body.should.not == nil
      body.position.should == CGPointMake(100, 100)
    end

    it "should initialize with position and type" do
      static_body = @world.new_body position: [100, 100]
      static_body.should.not == nil
      static_body.position.should == CGPointMake(100, 100)

      dynamic_body = @world.new_body position: [100, 100], type: Body::Dynamic
      dynamic_body.should.not == nil
      dynamic_body.position.should == CGPointMake(100, 100)

      kinematic_body = @world.new_body position: [100, 100], type: Body::Kinematic
      kinematic_body.should.not == nil
      kinematic_body.position.should == CGPointMake(100, 100)
    end

    it "should initialize with position, type and fixture" do
      body = @world.new_body position: [100, 100], type: Body::Dynamic do
        edge_fixture start_point: [0, 480],
                     end_point: [320, 480],
                     friction: 1,
                     restitution: 2,
                     density: 3,
                     is_sensor: true
      end

      body.should.not == nil
      body.position.should == CGPointMake(100, 100)
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

    static_body.position.should == CGPointMake(100, 100)
    dynamic_body.position.should == CGPointMake(100, 100)
    kinematic_body.position.should == CGPointMake(100, 100)

    @world.step delta: 10

    static_body.position = [200, 200]
    static_body.position.should == CGPointMake(200, 200)
    dynamic_body.position = [200, 200]
    dynamic_body.position.should.be.close CGPointMake(200, 200), 0.01
    kinematic_body.position = [200, 200]
    kinematic_body.position.should == CGPointMake(200, 200)
    
    @world.step delta: 10

    static_body.position.should == CGPointMake(200, 200)
    dynamic_body.position.should.be.close CGPointMake(200, 198.81), 0.01
    kinematic_body.position.should == CGPointMake(200, 200)  
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
    body.mass_data.rotational_inertia == 0.0
  end 

  it "should change its mass data" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    mass_data = MassData.new
    mass_data.mass = 2.0
    mass_data.center = [0.1, 0.1]
    mass_data.rotational_inertia = 1.0

    body.mass_data = mass_data

    body.mass_data.mass.should == 2.0
    body.mass_data.center.should.be.close CGPointMake(0.1, 0.1), 0.1
    body.mass_data.rotational_inertia == 1.0
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

    static_body.position.should == CGPointMake(100, 100)
    dynamic_body.position.should == CGPointMake(100, 100)
    kinematic_body.position.should == CGPointMake(100, 100)

    static_body.linear_velocity = [10, 10]
    static_body.linear_velocity.should == CGPointMake(0, 0)
    dynamic_body.linear_velocity = [10, 10]
    dynamic_body.linear_velocity.should == CGPointMake(10, 10)
    kinematic_body.linear_velocity = [10, 10]
    kinematic_body.linear_velocity.should == CGPointMake(10, 10)

    @world.step delta: 10

    static_body.position.should == CGPointMake(100, 100)
    dynamic_body.position.should.be.close CGPointMake(164, 100), 0.01
    kinematic_body.position.should.be.close CGPointMake(145.254, 145.254), 0.01   
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

    static_body.position.should == CGPointMake(100, 100)
    dynamic_body.position.should == CGPointMake(100, 100)
    kinematic_body.position.should == CGPointMake(100, 100)

    static_body.angular_velocity = 10.0
    static_body.angular_velocity.should == 0
    dynamic_body.angular_velocity = 10.0
    dynamic_body.angular_velocity.should == 10.0
    kinematic_body.angular_velocity = 10.0
    kinematic_body.angular_velocity.should == 10

    @world.step delta: 10

    static_body.position.should == CGPointMake(100, 100)
    dynamic_body.position.should.be.close CGPointMake(88.38, 36), 0.01
    kinematic_body.position.should == CGPointMake(100, 100)   
  end

  it "should create new fixtures" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic

    body.new_fixture do
      polygon_fixture box: [16, 16]
      polygon_fixture box: [16, 16]
    end

    body.fixtures.size.should == 2
  end

  it "should destroy fixtures" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic

    body.new_fixture do
      polygon_fixture box: [16, 16]
    end

    body.destroy_fixture(body.fixtures[0])
    body.fixtures.size.should == 0
  end 

  it "should convert from local point to world point" do
    body = @world.new_body position: [100, 100]
    body.to_world_point([0, 0]).should == CGPointMake(100, 100)
  end

  it "should convert from local vector to world vector" do
    body = @world.new_body position: [100, 100]
    body.to_world_vector([0, 0]).should == CGPointMake(0, 0)
  end

  it "should convert from world point to local point" do
    body = @world.new_body position: [100, 100]
    body.to_local_point([0, 0]).should == CGPointMake(-100, -100)
  end

  it "should convert from world vector to local vector" do
    body = @world.new_body position: [100, 100]
    body.to_local_vector([0, 0]).should == CGPointMake(0, 0)
  end

  it "should return the linear velocity at world point" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic
    body.linear_velocity = [10, 10]
    body.linear_velocity_at(world_point: [100, 100]).should == CGPointMake(10, 10)
  end 

  it "should return the linear velocity at local point" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic
    body.linear_velocity = [10, 10]
    body.linear_velocity_at(local_point: [0, 0]).should == CGPointMake(10, 10)
  end 

  it "should react to force applied as impulse" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    body.position.should == CGPointMake(100, 100)
    body.apply_force force: [1000, 1000]

    @world.step delta: 10
    body.position.should.be.close CGPointMake(127.135, 42.037), 0.001

    @world.step delta: 100
    body.position.should.be.close CGPointMake(127.141, -21.962), 0.001
  end

  it "should react to force applied instantaneously" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16]
    end

    body.position.should == CGPointMake(100, 100)
    body.apply_force force: [1000, 1000], as_impulse: false

    @world.step delta: 10
    body.position.should.be.close CGPointMake(152.765, 136.218), 0.001

    @world.step delta: 100
    body.position.should.be.close CGPointMake(152.776, 72.218), 0.001
  end

  it "should react to torque applied as impulse" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16],
                      density: 20
    end

    body.position.should == CGPointMake(100, 100)
    body.apply_torque torque: 1000

    @world.step delta: 10
    body.position.should.be.close CGPointMake(100.0, 36.0), 0.001

    @world.step delta: 100
    body.position.should.be.close CGPointMake(100.0, -28.0), 0.001
  end

  it "should react to torque applied instantaneously" do
    body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16],
                      density: 1
    end

    body.position.should == CGPointMake(100, 100)
    body.apply_torque torque: 1000, as_impulse: false

    @world.step delta: 10
    body.position.should.be.close CGPointMake(100.0, 36.0), 0.001

    @world.step delta: 100
    body.position.should.be.close CGPointMake(100.0, -28.0), 0.001
  end
end