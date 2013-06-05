describe Joybox::UI::Label do
  
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

    it "should initialize with text & alignment" do
      label = Label.new text: 'Label',
                        position: [100, 100],
                        alignment: Joybox::UI::Label::TextAlignmentRight,
                        vertical_alignment: KCCVerticalTextAlignmentTop

      label.should.not == nil
      label.text.should == 'Label'
      label.position.should == CGPointMake(100, 100)
      label.alignment.should == Joybox::UI::Label::TextAlignmentRight
      label.vertical_alignment.should == KCCVerticalTextAlignmentTop
    end 

    it "should initialize with text & font" do
      label = Label.new text: 'Label',
                        position: [100, 100],
                        font_name: 'Helvetica',
                        font_size: 20

      label.should.not == nil
      label.text.should == 'Label'
      label.position.should == CGPointMake(100, 100)
      label.font_name.should == 'Helvetica'
      label.font_size.should == 20
    end

    it "should initialize with text & dimensions" do
      label = Label.new text: 'Label',
                        position: [100, 100],
                        dimensions: [200, 200]

      label.should.not == nil
      label.text.should == 'Label'
      label.position.should == CGPointMake(100, 100)
      label.dimensions.should == CGSizeMake(200, 200)
    end
  end

  it "should change its text" do
    label = Label.new text: 'Label',
                      position: [100, 100],
                      alignment: Joybox::UI::Label::TextAlignmentRight,
                      vertical_alignment: KCCVerticalTextAlignmentTop

    label.text.should == 'Label'

    label.text = 'Changed Label'
    label.text.should == 'Changed Label'
  end
end