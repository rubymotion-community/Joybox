describe Joybox::UI::Label do
  behaves_like Joybox::UI::Label
  
  describe "Initialization" do
    it "should initialize with text" do 
      color = "#FFFFFF".to_color
      label = Label.new text: 'Label',
                        position: [100, 100],
                        color: color

      label.should.not == nil
      label.text.should == 'Label'
      label.position.should == CGPointMake(100, 100)
      label.color.r.should == color.red
      label.color.g.should == color.green
      label.color.b.should == color.blue
    end
  end
  
end