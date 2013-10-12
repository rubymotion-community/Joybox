describe Joybox::UI::Menu do
  behaves_like Joybox::UI::Menu

  it "should align items vertically" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)

    menu.align_items_vertically

    @items[0].position.should == CGPointMake(0, 48)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, -48)
  end

  it "should align items vertically with padding" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)

    menu.align_items_vertically_with_padding(100)

    @items[0].position.should == CGPointMake(0, 143)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, -143)
  end

  it "should align items horizontally" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)

    menu.align_items_horizontally

    @items[0].position.should.be.close CGPointMake(-90.5, 0), 0.1
    @items[1].position.should.be.close CGPointMake(-9.1, 0), 0.1
    @items[2].position.should.be.close CGPointMake(81.4,  0), 0.1
  end

  it "should align items horizontally with padding" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)

    menu.align_items_horizontally_with_padding(100)

    @items[0].position.should.be.close CGPointMake(-185.5, 0), 0.1
    @items[1].position.should.be.close CGPointMake(-9.1, 0), 0.1
    @items[2].position.should.be.close CGPointMake(176.4,  0), 0.1
  end

  it "should align items in columns" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)

    menu.align_items_in_columns [2, 1]

    @items[0].position.should == CGPointMake(-80.0, 23.5)
    @items[1].position.should == CGPointMake(80.0, 23.5)
    @items[2].position.should == CGPointMake(0, -24.5)
  end

  it "should align items in rows" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)

    menu.align_items_in_rows [2, 1]

    @items[0].position.should == CGPointMake(-48.0, 45.5)
    @items[1].position.should == CGPointMake(-48.0, -7.5)
    @items[2].position.should == CGPointMake(42, 21.5)
  end
end
