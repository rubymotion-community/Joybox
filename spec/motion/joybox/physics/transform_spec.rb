describe Joybox::Physics::Transform do

  it "should convert between coordinate systems" do
    transform = Transform.new

    transform.position = [32, 32]
    transform.metric_position.should == CGPointMake(1, 1)

    transform.metric_position = [2, 2]
    transform.position.should == CGPointMake(64, 64)
  end

end