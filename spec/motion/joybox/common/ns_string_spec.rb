describe NSString do
  it "should return a color from a hex" do
    color = '#272822'.to_color
    color.red.should == 39
    color.green.should == 40
    color.blue.should == 34
  end
end