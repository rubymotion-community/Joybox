describe Joybox::Core::Sprite do

  describe "Initialization" do
    it "should initialize with file name" do 
      sprite = Sprite.new file_name: 'sprite.png', position: CGPointMake(100, 100)
      sprite.should.not == nil
      sprite.position.should == CGPointMake(100, 100)
      sprite.contentSize.should.not == CGSizeMake(0, 0)
      sprite.visible.should == true
    end

    it "should initialize with file name and rect" do 
      sprite = Sprite.new file_name: 'sprite.png', position: CGPointMake(100, 100), rect: CGRectMake(0, 0, 27, 40)
      sprite.should.not == nil
      sprite.position.should == CGPointMake(100, 100)
      sprite.contentSize.should == CGSizeMake(27, 40)
      sprite.visible.should == true
      sprite.bounding_box.should == CGRectMake(86.5, 80, 27, 40)
    end

    it "should initialize with frame name" do
      SpriteFrameCache.frames.add file_name: 'animation_frames.plist'
      sprite = Sprite.new frame_name: 'bear1.png', position: CGPointMake(100, 100)
      sprite.should.not == nil
      sprite.position.should == CGPointMake(100, 100)
      sprite.contentSize.should.not == CGSizeMake(0, 0)
      sprite.visible.should == true
    end

    it "should initialize with texture" do
      sprite_batch = SpriteBatch.new file_name: 'sprite_sheet.png'
      sprite = Sprite.new texture: sprite_batch.texture, position: CGPointMake(100, 100)
      sprite.should.not == nil
      sprite.position.should == CGPointMake(100, 100)
      sprite.contentSize.should.not == CGSizeMake(0, 0)
      sprite.visible.should == true
    end

    it "should initialize with texture and rect" do
      sprite_batch = SpriteBatch.new file_name: 'sprite_sheet.png'
      sprite = Sprite.new texture: sprite_batch.texture, position: CGPointMake(100, 100), rect: CGRectMake(0, 0, 16, 16)
      sprite.should.not == nil
      sprite.position.should == CGPointMake(100, 100)
      sprite.contentSize.should == CGSizeMake(16, 16)
      sprite.visible.should == true
      sprite.bounding_box.should == CGRectMake(92, 92, 16, 16)
    end
  end


  describe "Flip" do
    before do
      @sprite = Sprite.new file_name: 'sprite.png', position: CGPointMake(100, 100)
    end

    it "should flip in the X axis" do
      @sprite.flip x: true, y: false
      @sprite.flipX.should == true
    end

    it "should flip in the Y axis" do
      @sprite.flip x: false, y: true
      @sprite.flipY.should == true
    end

    it "should flip in both axis" do
      @sprite.flip x: true, y: true
      @sprite.flipX.should == true
      @sprite.flipX.should == true
    end
  end

  describe "Image Name" do
    it "should change its image name" do
      sprite = Sprite.new file_name: 'sprite.png', position: CGPointMake(100, 100)
      first_texture = sprite.texture
      sprite.file_name = 'sprite_sheet.png'
      sprite.texture.should.not == first_texture
    end

    it "should change its image name if it was initialized with frame name" do
      SpriteFrameCache.frames.add file_name: 'animation_frames.plist'
      sprite = Sprite.new frame_name: 'bear1.png', position: CGPointMake(100, 100)
      sprite.file_name = 'sprite_sheet.png'
      sprite.texture.should.not == nil
    end

    it "should not change its image name if it was initialized with texture" do
      sprite_batch = SpriteBatch.new file_name: 'sprite_sheet.png'
      sprite = Sprite.new texture: sprite_batch.texture, position: CGPointMake(100, 100)
      first_texture = sprite.texture
      sprite.file_name = 'sprite_sheet.png'
      sprite.texture.should == first_texture
    end
  end

  describe "Frame" do
    it "should return if it is displaying a frame" do
      SpriteFrameCache.frames.add file_name: 'animation_frames.plist'
      sprite = Sprite.new frame_name: 'bear1.png', position: CGPointMake(100, 100)

      sprite.displays_frame?(SpriteFrameCache.frames['bear1.png']).should == true
    end

    it "should return its displayed frame" do
      SpriteFrameCache.frames.add file_name: 'animation_frames.plist'
      sprite = Sprite.new frame_name: 'bear1.png', position: CGPointMake(100, 100)

      sprite.frame.should.not == nil
    end

    it "should change its displayed frame" do
      SpriteFrameCache.frames.add file_name: 'animation_frames.plist'
      sprite = Sprite.new frame_name: 'bear1.png', position: CGPointMake(100, 100)

      sprite.frame = SpriteFrameCache.frames['bear2.png']
      sprite.displays_frame?(SpriteFrameCache.frames['bear2.png']).should == true
    end
  end

end