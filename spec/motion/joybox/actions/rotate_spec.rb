describe Joybox::Actions::Rotate do
  behaves_like "Action Sprite"

  it "should rotate the sprite by angle" do
    @sprite.run_action Rotate.by angle: 15
    @sprite.rotation = 5
    @sprite.rotation.should == 5

    wait 0.2 do
      @sprite.rotation.should.not == 5
      @sprite.rotation.should.not.be.close 15, 0.1
    end

    wait 0.4 do
      @sprite.rotation.should.not == 5
      @sprite.rotation.should.be.close 15, 0.1
    end
  end

  it "should rotate the sprite to angle" do
    @sprite.run_action Rotate.to angle: 15
    @sprite.rotation = 5
    @sprite.rotation.should == 5

    wait 0.2 do
      @sprite.rotation.should.not == 5
      @sprite.rotation.should.not.be.close 15, 0.1
    end

    wait 0.4 do
      @sprite.rotation.should.not == 5
      @sprite.rotation.should.be.close 15, 0.1
    end
  end
end