describe Joybox::Core::LayerGradient do

  describe "LayerGradient.new" do
    it "should initialize" do
      layer = Joybox::Core::LayerGradient.new(
        start: [1, 2, 3, 4],
        end: [1, 2, 3, 4],
        vector: [1, 2])
      layer.should.not == nil
      layer.visible.should == true
      layer.class.should == Joybox::Core::LayerGradient
    end
  end

  describe "LayerGradient.scene" do
    it "should define singleton method and return CCScene with LayerGradient" do
      Joybox::Core::LayerGradient.scene
      scene = Joybox::Core::LayerGradient.scene(start: [1, 2, 3, 4], end: [5, 6, 7, 8], vector: [1, 2])
      scene.class.should == CCScene
      scene.children.first.class.should == Joybox::Core::LayerGradient
    end
  end

end
