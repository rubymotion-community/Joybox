describe Joybox::Actions::Place do
  behaves_like "Action Sprite"

  it "should place the sprite in position" do
    @sprite.position.should == CGPointMake(5, 5)
    @sprite.run_action Place.in position: [100, 100]
    
    wait 0.1 do
      @sprite.position.should == CGPointMake(100, 100)
    end
  end
end