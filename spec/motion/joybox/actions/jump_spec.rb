describe Joybox::Actions::Jump do
  behaves_like "Action Sprite"

  it "should jump the sprite by position" do
    @sprite.run_action Jump.by position: [15, 15], height: 15
    @sprite.position.should == CGPointMake(5, 5)

    wait 0.2 do
      @sprite.position.should.not == CGPointMake(5, 5)
      @sprite.position.x.should.not.be.close 20, 2
      @sprite.position.y.should.not.be.close 20, 2
    end

    wait 0.4 do
      @sprite.position.should.not == CGPointMake(5, 5)
      @sprite.position.x.should.be.close 20, 2
      @sprite.position.y.should.be.close 20, 2
    end
  end

  it "should jump the sprite to position" do
    @sprite.run_action Jump.to position: [10, 10], height: 15   
    @sprite.position.should == CGPointMake(5, 5)

    wait 0.2 do
      @sprite.position.should.not == CGPointMake(5, 5)
      @sprite.position.x.should.not.be.close 10, 2
      @sprite.position.y.should.not.be.close 10, 2
    end

    wait 0.4 do
      @sprite.position.should.not == CGPointMake(5, 5)
      @sprite.position.x.should.be.close 10, 2
      @sprite.position.y.should.be.close 10, 2
    end
  end
end