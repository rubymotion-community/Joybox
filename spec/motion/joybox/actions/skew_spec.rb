describe Joybox::Actions::Skew do
  behaves_like "Action Sprite"

  it "should skew the sprite by x & y" do
    @sprite.run_action Skew.by x: 15, y: 15
    @sprite.skewX.should == 0
    @sprite.skewY.should == 0
    
    wait 0.2 do
      @sprite.skewX.should.not == 0
      @sprite.skewY.should.not == 0
      @sprite.skewX.should.not.be.close 15, 0.1
      @sprite.skewY.should.not.be.close 15, 0.1
    end

    wait 0.4 do
      @sprite.skewX.should.not == 0
      @sprite.skewY.should.not == 0
      @sprite.skewX.should.be.close 15, 0.1
      @sprite.skewY.should.be.close 15, 0.1
    end
  end

  it "should skew the sprite to x & y" do
    @sprite.run_action Skew.to x: 15, y: 15
    @sprite.skewX.should == 0
    @sprite.skewY.should == 0
    
    wait 0.2 do
      @sprite.skewX.should.not == 0
      @sprite.skewY.should.not == 0
      @sprite.skewX.should.not.be.close 15, 0.1
      @sprite.skewY.should.not.be.close 15, 0.1
    end

    wait 0.4 do
      @sprite.skewX.should.not == 0
      @sprite.skewY.should.not == 0
      @sprite.skewX.should.be.close 15, 0.1
      @sprite.skewY.should.be.close 15, 0.1
    end
  end
end