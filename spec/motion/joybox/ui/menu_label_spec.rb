shared Joybox::UI::MenuLabel do
  after do
    MenuLabel.default_font_size = 32
    MenuLabel.default_font_name = 'Marker Felt'
  end
 
  describe "Initialization" do
    it "should initialize with text" do
      menu_label = MenuLabel.new text: 'MenuLabel'
      menu_label.should.not == nil
      menu_label.text.should == 'MenuLabel'
    end

    it "should initialize with text & position" do 
      menu_label = MenuLabel.new text: 'MenuLabel', position: [100, 100]
      menu_label.should.not == nil
      menu_label.text.should == 'MenuLabel'
      menu_label.position.should == CGPointMake(100, 100)
    end

    it "should initialize with text & font" do
      menu_label = MenuLabel.new text: 'MenuLabel',
                            font_name: 'Helvetica',
                            font_size: 20

      menu_label.should.not == nil
      menu_label.text.should == 'MenuLabel'
      menu_label.font_name.should == 'Helvetica'
      menu_label.font_size.should == 20
    end
  end

  it "should set the default font for the Menu Labels" do
    MenuLabel.default_font_name = 'Helvetica'

    menu_label = MenuLabel.new text: 'MenuLabel'
    menu_label.should.not == nil
    menu_label.text.should == 'MenuLabel'
    menu_label.font_name.should == 'Helvetica'
  end

  it "should set the default font size for the Menu Labels" do
    MenuLabel.default_font_size = 40

    menu_label = MenuLabel.new text: 'MenuLabel'
    menu_label.should.not == nil
    menu_label.text.should == 'MenuLabel'
    menu_label.font_size.should == 40
  end

  it "should change its text" do
    menu_label = MenuLabel.new text: 'MenuLabel'

    menu_label.text.should == 'MenuLabel'

    menu_label.text = 'Changed MenuLabel'
    menu_label.text.should == 'Changed MenuLabel'
  end

  it "should notify touch" do
    menu_label = MenuLabel.new text: 'MenuLabel' do |menu_item|
      menu_item.should.not == nil
      menu_item.text.should == 'MenuLabel'
    end

    menu_label.activate
  end
end