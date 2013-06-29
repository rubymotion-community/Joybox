describe Joybox::Physics::MassData do

  it "should convert between coordinate systems" do
    mass_data = MassData.new

    mass_data.center = [32, 32]
    mass_data.metric_center.should == CGPointMake(1, 1)

    mass_data.metric_center = [2, 2]
    mass_data.center.should == CGPointMake(64, 64)
  end

end