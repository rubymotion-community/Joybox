describe Joybox::Core::LayerColor do

  describe "LayerColor.new" do
    it "should initialize with options" do
      layer = Joybox::Core::LayerColor.new(
        color: "800617".to_color,
        width: 100,
        height: 100,
        position: [100, 100],
        opacity: 100)
      layer.should.not == nil
      layer.position.should == CGPoint.new(100, 100)
      layer.color.should == CcColor3B.new(*("800617".unpack("a2a2a2").map { |x| x.to_i(16) }))
      layer.opacity.should == 100
      layer.visible.should == true
      layer.class.should == Joybox::Core::LayerColor
    end
  end

  describe "LayerColor.scene" do
    it "should define singleton method and return CCScene with LayerColor" do
      Joybox::Core::LayerColor.scene
      scene = Joybox::Core::LayerColor.scene(color: [1, 2, 3])
      scene.class.should == CCScene
      scene.children.first.class.should == Joybox::Core::LayerColor
    end
  end

end
