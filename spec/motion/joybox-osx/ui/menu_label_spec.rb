describe Joybox::UI::MenuLabel do
  behaves_like Joybox::UI::MenuLabel
 
  describe "Initialization" do
    it "should initialize with text & color" do 
      color = "#FFFFFF".to_color
      menu_label = MenuLabel.new text: 'MenuLabel', color: color
      menu_label.should.not == nil
      menu_label.text.should == 'MenuLabel'
      menu_label.color.should.not == nil
    end
  end
end