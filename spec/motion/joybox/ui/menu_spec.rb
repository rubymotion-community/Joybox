shared Joybox::UI::Menu do
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
end