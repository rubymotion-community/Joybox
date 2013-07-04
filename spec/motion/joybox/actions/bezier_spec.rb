describe Joybox::Actions::Bezier do
  behaves_like "Action Sprite"

  it "should move the sprite by bezier path" do
    @sprite.run_action Bezier.by bezier: [[100, 100], [50, 50], [-50, -50]]
    @sprite.position.should == CGPointMake(5, 5)

    wait 0.2 do
      @sprite.position.should.not == CGPointMake(5, 5)
      @sprite.position.x.should.not.be.close 105, 2
      @sprite.position.y.should.not.be.close 105, 2
    end

    wait 0.4 do
      @sprite.position.should.not == CGPointMake(5, 5)
      @sprite.position.x.should.be.close 105, 2
      @sprite.position.y.should.be.close 105, 2
    end
  end

  it "should move the sprite to bezier path" do
    @sprite.run_action Bezier.to bezier: [[100, 100], [50, 50], [-50, -50]]
    @sprite.position.should == CGPointMake(5, 5)

    wait 0.2 do
      @sprite.position.should.not == CGPointMake(5, 5)
      @sprite.position.x.should.not.be.close 100, 2
      @sprite.position.y.should.not.be.close 100, 2
    end

    wait 0.4 do
      @sprite.position.should.not == CGPointMake(5, 5)
      @sprite.position.x.should.be.close 100, 2
      @sprite.position.y.should.be.close 100, 2
    end
  end
end