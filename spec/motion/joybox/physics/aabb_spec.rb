describe Joybox::Physics::AABB do

  it "should convert between coordinate systems" do
    aabb = AABB.new

    aabb.lower_bound = [32, 32]
    aabb.upper_bound = [32, 32]
    aabb.metric_upper_bound.should == CGPointMake(1, 1)
    aabb.metric_lower_bound.should == CGPointMake(1, 1)

    aabb.metric_upper_bound = [2, 2]
    aabb.metric_lower_bound = [2, 2]
    aabb.lower_bound.should == CGPointMake(64, 64)
    aabb.upper_bound.should == CGPointMake(64, 64)
  end

end