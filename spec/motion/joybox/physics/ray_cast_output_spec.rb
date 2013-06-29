describe Joybox::Physics::RayCastOutput do

  it "should convert between coordinate systems" do
    ray_cast_output = RayCastOutput.new

    ray_cast_output.normal = [32, 32]
    ray_cast_output.metric_normal.should == CGPointMake(1, 1)

    ray_cast_output.metric_normal = [2, 2]
    ray_cast_output.normal.should == CGPointMake(64, 64)
  end

end