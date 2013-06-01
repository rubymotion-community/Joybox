describe Numeric do
  before do
    @number = 50
  end

  it "should convert to pixel coordinates" do
    @number.to_pixels.should == 1.5625
  end

  it "should convert from pixel coordinates" do
    1.5625.from_pixels.should == @number
  end
end