describe Joybox::Physics::RayCastInput do

  it "should convert between coordinate systems" do
    ray_cast_input = RayCastInput.new

    ray_cast_input.first_point = [32, 32]
    ray_cast_input.second_point = [32, 32]
    ray_cast_input.metric_first_point.should == CGPointMake(1, 1)
    ray_cast_input.metric_second_point.should == CGPointMake(1, 1)

    ray_cast_input.metric_first_point = [2, 2]
    ray_cast_input.metric_second_point = [2, 2]
    ray_cast_input.first_point.should == CGPointMake(64, 64)
    ray_cast_input.second_point.should == CGPointMake(64, 64)
  end

end