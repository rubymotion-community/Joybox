describe Joybox::Core::Color do
  describe "Initialization" do
    it "should initialize with options" do
      color = Color.create red:39, green:40, blue:34
      color.red.should == 39
      color.green.should == 40
      color.blue.should == 34
    end

    it "should initialize with rgb" do
      color = Color.from_rgb(39, 40, 34)
      color.red.should == 39
      color.green.should == 40
      color.blue.should == 34
    end

    it "should initialize with hex" do
      color = Color.from_hex('#272822')
      color.red.should == 39
      color.green.should == 40
      color.blue.should == 34
    end

    it "should initialize from string" do
      color = '#272822'.to_color
      color.red.should == 39
      color.green.should == 40
      color.blue.should == 34
    end
  end
end