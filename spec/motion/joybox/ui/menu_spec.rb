describe Joybox::UI::Menu do
  before do
    @items = Array.new

    @items << MenuLabel.new(text: 'Label')
    @items << MenuLabel.new(text: 'Label2')
    @items << MenuLabel.new(text: 'Label3')
  end

  describe "Initialization" do
    it "should initialize with position & items" do 
      menu = Menu.new items: @items
      menu.children.count.should == @items.size
    end
  end

  it "should add new items" do
    menu = Menu.new items: @items
    menu.children.count.should == @items.size

    menu << MenuLabel.new(text: 'Label4')
    menu << MenuLabel.new(text: 'Label5')

    menu.children.count.should == @items.size + 2
  end

  it "should align items vertically" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)
    
    menu.align_items_vertically

    @items[0].position.should == CGPointMake(0, 40)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, -40)
  end

  it "should align items vertically with padding" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)
    
    menu.align_items_vertically_width_padding(100)

    @items[0].position.should == CGPointMake(0, 135)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, -135)
  end

  it "should align items horizontally" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)
    
    menu.align_items_horizontally

    @items[0].position.should == CGPointMake(-86.0, 0)
    @items[1].position.should == CGPointMake(-9.0, 0)
    @items[2].position.should == CGPointMake(77,  0)
  end

  it "should align items horizontally with padding" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)
    
    menu.align_items_horizontally_with_padding(100)

    @items[0].position.should == CGPointMake(-181.0, 0)
    @items[1].position.should == CGPointMake(-9.0, 0)
    @items[2].position.should == CGPointMake(172,  0)
  end

  it "should align items in columns" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)
    
    menu.align_items_in_columns [2, 1]

    @items[0].position.should == CGPointMake(-80.0, 19.5)
    @items[1].position.should == CGPointMake(80.0, 19.5)
    @items[2].position.should == CGPointMake(0, -20.5)
  end

  it "should align items in rows" do
    menu = Menu.new items: @items

    @items[0].position.should == CGPointMake(0, 0)
    @items[1].position.should == CGPointMake(0, 0)
    @items[2].position.should == CGPointMake(0, 0)
    
    menu.align_items_in_rows [2, 1]

    @items[0].position.should == CGPointMake(-46.0, 37.5)
    @items[1].position.should == CGPointMake(-46.0, -7.5)
    @items[2].position.should == CGPointMake(40, 17.5)
  end
end