describe Joybox::Actions::Scale do
  behaves_like "Action Sprite"

  it "should scale the sprite by number" do
    @sprite.run_action Scale.by scale: 1.5
    @sprite.scaleX.should == 1.0
    @sprite.scaleY.should == 1.0

    wait 0.2 do
      @sprite.scaleX.should.not == 1.0
      @sprite.scaleY.should.not == 1.0
      @sprite.scaleX.should.not.be.close 1.5, 0.1
      @sprite.scaleY.should.not.be.close 1.5, 0.1
    end

    wait 0.4 do
      @sprite.scaleX.should.not == 1.0
      @sprite.scaleY.should.not == 1.0
      @sprite.scaleX.should.be.close 1.5, 0.1
      @sprite.scaleY.should.be.close 1.5, 0.1
    end
  end

  it "should scale the sprite to number" do
    @sprite.run_action Scale.to scale: 1.5
    @sprite.scaleX.should == 1.0
    @sprite.scaleY.should == 1.0

    wait 0.2 do
      @sprite.scaleX.should.not == 1.0
      @sprite.scaleY.should.not == 1.0
      @sprite.scaleX.should.not.be.close 1.5, 0.1
      @sprite.scaleY.should.not.be.close 1.5, 0.1
    end

    wait 0.4 do
      @sprite.scaleX.should.not == 1.0
      @sprite.scaleY.should.not == 1.0
      @sprite.scaleX.should.be.close 1.5, 0.1
      @sprite.scaleY.should.be.close 1.5, 0.1
    end
  end
end