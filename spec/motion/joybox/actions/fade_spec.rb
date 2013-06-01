describe Joybox::Actions::Fade do
  behaves_like "Action Sprite"

  it "should fade the sprite in to number" do
    @sprite.run_action Fade.in opacity:255
    @sprite.opacity = 0
    @sprite.opacity.should == 0

    wait 0.2 do
      @sprite.opacity.should.not == 0
      @sprite.opacity.should.not.be.close 255, 0.1
    end

    wait 0.4 do
      @sprite.opacity.should.not == 0
      @sprite.opacity.should.be.close 255, 0.1
    end
  end

  it "should fade the sprite out to number" do
    @sprite.run_action Fade.out opacity: 0
    @sprite.opacity.should == 255

    wait 0.2 do
      @sprite.opacity.should.not == 255
      @sprite.opacity.should.not.be.close 0, 0.1
    end

    wait 0.4 do
      @sprite.opacity.should.not == 255
      @sprite.opacity.should.be.close 0, 0.1
    end
  end

  it "should fade the sprite to number" do
    @sprite.run_action Fade.to opacity:100
    @sprite.opacity.should == 255

    wait 0.2 do
      @sprite.opacity.should.not == 0
      @sprite.opacity.should.not.be.close 100, 0.1
    end

    wait 0.4 do
      @sprite.opacity.should.not == 0
      @sprite.opacity.should.be.close 100, 0.1
    end
  end
end