describe Joybox::Physics::PhysicsSprite do
  before do
    @world = World.new gravity: [0, -9.8]
    @body = @world.new_body position: [100, 100], type: KDynamicBodyType do
      polygon_fixture box: [16, 16]
    end
  end

  describe "Initialization" do
    it "should initialize with a body" do 
      physics_sprite = PhysicsSprite.new file_name: 'sprite.png', body: @body
      physics_sprite.should.not == nil
      physics_sprite.body.should == @body
      physics_sprite.position.should == CGPointMake(100, 100)
      physics_sprite.contentSize.should == CGSizeMake(101, 171)
      physics_sprite.visible.should == true
      physics_sprite.bounding_box.should == CGRectMake(49.5, 14.5, 101, 171)
    end
  end

  it "should be dirty" do
    physics_sprite = PhysicsSprite.new file_name: 'sprite.png', body: @body
    physics_sprite.dirty.should == true
  end

  it "should return its position" do
    physics_sprite = PhysicsSprite.new file_name: 'sprite.png', body: @body
    physics_sprite.position.should == CGPointMake(100, 100)
    physics_sprite.body.position.should == CGPointMake(100, 100)
  end

  it "should change its position" do
    physics_sprite = PhysicsSprite.new file_name: 'sprite.png', body: @body
    physics_sprite.position.should == CGPointMake(100, 100)

    physics_sprite.position = CGPointMake(200, 200)
    physics_sprite.position.should == CGPointMake(200, 200)
    physics_sprite.body.position.should == CGPointMake(200, 200)
  end

  it "should adjust to its body position" do
    physics_sprite = PhysicsSprite.new file_name: 'sprite.png', body: @body
    physics_sprite.position.should == CGPointMake(100, 100)

    @world.step delta:10

    physics_sprite.position.should == CGPointMake(100, 36)
    physics_sprite.body.position.should == CGPointMake(100, 36)
  end
end