describe Joybox::Physics::Shape do
  before do
    @world = World.new gravity: [0, -9.8]
    @body = @world.new_body position: [100, 100], type: Body::Dynamic do
      circle_fixture  radius: 60,
                      density: 1.0,
                      friction: 1.0,
                      restitution: 1.0
    end
    @shape = @body.fixtures[0].shape
  end

  it "should have radius" do
    @shape.radius.should == 60
  end

  it "should know if contains a point" do
    # @shape.contains_point?(point: [0, 0], position: [0, 0], angle: 0).should == true
    # @shape.contains_point?(point: [101, 101], position: [100, 100], angle: 30).should == false

    shape = CircleShape.new radius: 320
    shape.contains_point?(point: [0, 0], position: [0, 0], angle: 0).should == true
    shape.contains_point?(point: [352, 352], position: [0, 0], angle: 0).should == false
  end

  it "should ray cast the shape" do
    ray_cast_notified = false

    @shape.ray_cast first_point:[60, 60], 
                    second_point:[1, 1], 
                    maximum_fraction: 20, 
                    position: [0, 0],
                    angle: 0,
                    child_index: 0 do |hits, normal, fraction|
                      ray_cast_notified = true
                      hits.should == true
                      normal.should.be.close CGPointMake(22.62, 22.62), 0.01
                    end

    ray_cast_notified.should == true
  end

  it "should compute its aabb" do
    # aabb = @shape.compute_aabb position: [10, 10], angle: 0, child_index: 0
    # aabb.lower_bound.should == CGPointMake(-50, -50)
    # aabb.upper_bound.should == CGPointMake(70, 70)

    shape = CircleShape.new radius: 320
    aabb = shape.compute_aabb position: [32, 32], angle: 0, child_index: 0
    aabb.lower_bound.should == CGPointMake(-288, -288)
    aabb.upper_bound.should == CGPointMake(352, 352)
  end

  it "should compute its mass" do
    mass_data = @shape.compute_mass density: 1
    mass_data.mass.should.be.close 11.044, 0.01
    mass_data.center.should == CGPointMake(0, 0)
    mass_data.rotational_inertia.should.be.close 19.414, 0.01
  end
end