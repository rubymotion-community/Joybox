describe Joybox::Physics::Fixture do
  before do
    @world = World.new gravity: [0, -9.8]
    @body = @world.new_body position: [100, 100], type: Body::Dynamic do
      polygon_fixture box: [16, 16],
                      density: 1.0,
                      friction: 1.0,
                      restitution: 1.0
    end
  end

  it "should have type" do
    fixture = @body.fixtures[0]
    fixture.type.should == Fixture::Polygon
  end

  it "should have a shape" do
    fixture = @body.fixtures[0]
    fixture.shape.should.not == nil
    fixture.shape.type.should == Fixture::Polygon
  end

  it "should have filter data" do
    fixture = @body.fixtures[0]
    fixture.filter_data.category_bits.should == 1
    fixture.filter_data.mask_bits.should == 65535
    fixture.filter_data.group_index.should == 0
  end

  it "should change its filter data" do
    fixture = @body.fixtures[0]

    filter = Filter.new
    filter.category_bits = 0x0001
    filter.mask_bits = 0xFFFF
    filter.group_index = 0

    fixture.filter_data = filter
    fixture.filter_data.category_bits.should == 0x0001
    fixture.filter_data.mask_bits.should == 0xFFFF
    fixture.filter_data.group_index.should == 0
  end

  it "should have a body" do
    fixture = @body.fixtures[0]
    fixture.body.should == @body
  end

  it "should have density" do
    fixture = @body.fixtures[0]
    fixture.density.should == 1.0
  end

  it "should have friction" do
    fixture = @body.fixtures[0]
    fixture.friction.should == 1.0
  end

  it "should have restitution" do
    fixture = @body.fixtures[0]
    fixture.restitution.should == 1.0
  end

  it "should be a sensor" do
    fixture = @body.fixtures[0]
    fixture.sensor = true
    fixture.sensor.should == true
  end

  it "should have mass data" do
    fixture = @body.fixtures[0]

    fixture.mass_data.mass.should == 1.0
    fixture.mass_data.center.should == CGPointMake(0, 0)
    fixture.mass_data.rotational_inertia == 0.0
  end

  it "should know if contains a point" do
    fixture = @body.fixtures[0]
    fixture.contains_point?([100, 100]).should == true
  end

  it "should have an AABB" do
    fixture = @body.fixtures[0]
    aabb = fixture.aabb child_index: 0
    aabb.lower_bound.should.be.close CGPointMake(83.68, 83.68), 0.01
    aabb.upper_bound.should.be.close CGPointMake(116.31, 116.31), 0.01
  end

  it "should ray cast the fixture with a first point, second point and maximum fraction" do
    fixture = @body.fixtures[0]

    ray_cast_notified = false

    fixture.ray_cast first_point:[320, 320], 
                     second_point:[32, 32], 
                     maximum_fraction: 20, 
                     child_index: 0 do |hits, normal, fraction|
                       ray_cast_notified = true
                       hits.should == true
                       normal.should == CGPointMake(32.0, 0.0)
                       fraction.should.be.close 0.708, 0.001
                     end

    ray_cast_notified.should == true
  end
end