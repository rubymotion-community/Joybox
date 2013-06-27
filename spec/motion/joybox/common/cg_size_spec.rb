describe CGSize do
  before do
    @size = CGSizeMake(50, 50)
  end

  it "should return the half of the width" do
    @size.half_width.should == 25
  end

  it "should return the double of the width" do
    @size.double_width.should == 100
  end

  it "should return the half of the height" do
    @size.half_height.should == 25
  end

  it "should return the double of the height" do
    @size.double_height.should == 100
  end

  it "should convert from pixel coordinates" do
    @size.from_pixel_coordinates.should == CGSizeMake(1.5625, 1.5625)
  end

  it "should convert to pixel coordinates" do
    CGSizeMake(1.5625, 1.5625).to_pixel_coordinates.should == @size
  end
end