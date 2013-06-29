describe Joybox::Core::Screen do
  before do
    @window = UIApplication.sharedApplication.windows[0]
  end

  it "should return the width of the screen" do
    Screen.width.should == @window.bounds.size.height
  end

  it "should return the half of the screen width" do
    Screen.half_width.should == @window.bounds.size.height / 2
  end

  it "should return the height of the screen" do
    Screen.height.should == @window.bounds.size.width
  end

  it "should return the half of the screen height" do
    Screen.half_height.should == @window.bounds.size.width / 2
  end
end