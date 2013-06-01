shared "Action Sprite" do
  before do
    @scene = Scene.new
    @layer = Layer.new
    @sprite = Sprite.new file_name: 'sprite.png', position: CGPointMake(5, 5)
    @scene << @layer
    @layer << @sprite 

    Joybox.director << @scene
  end
end