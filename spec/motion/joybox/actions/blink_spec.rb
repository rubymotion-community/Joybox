describe Joybox::Actions::Blink do
  behaves_like "Action Sprite"

  it "should blink the sprite with times" do
    @sprite.run_action Blink.with times:1
    @sprite.visible.should == true

    wait 0.1 do
      @sprite.visible.should == false
    end

    wait 0.4 do
      @sprite.visible.should == true
    end
  end
end