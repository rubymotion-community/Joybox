describe CCNode do

  describe "Children" do 
    before do
      @node = CCNode.new
    end

    it "should have empty children subclasses" do
      @node.children.should == nil
    end

    it "should add subclass as a child" do
      sprite = Sprite.new file_name: 'sprite.png'
      @node << sprite
      @node.children.count.should == 1
    end

    it "should add many subclasses as childs" do
      sprite = Sprite.new file_name: 'sprite.png'
      layer = Layer.new
      @node.add_children(sprite, layer)
      @node.children.count.should == 2
    end

    it "should clean all the children subclasses" do 
      @node.removeAllChildren
      @node.children.should == nil
    end

    it "should clean all the children subclasses and stop the actions" do 
      @node.removeAllChildrenWithCleanup(true)
      @node.children.should == nil
    end
  end

end