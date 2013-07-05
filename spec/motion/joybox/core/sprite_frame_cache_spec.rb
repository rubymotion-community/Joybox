describe Joybox::Core::SpriteFrameCache do

  describe "Add Frames" do
    before do
      SpriteFrameCache.purge
    end

    it "should add a frame with name" do
      frame = CCSpriteFrame.alloc.initWithTextureFilename('animation_sprite_sheet.png', rect:[[237, 443], [233, 145]])
      SpriteFrameCache.frames['frame'] = frame
      frame = SpriteFrameCache.frames['frame']
      frame.should.not == nil
      frame.texture.should.not == nil
      frame.rect.should == CGRectMake(237, 443, 233, 145)
    end

    it "should add frames from a PLIST file" do
      SpriteFrameCache.frames.add file_name: 'animation_frames.plist'
      frame = SpriteFrameCache.frames['bear1.png']
      frame.should.not == nil
      frame.texture.should.not == nil
      frame.rect.should == CGRectMake(237, 443, 233, 145)
    end

    it "should add frames with a texture" do
      texture = CCTextureCache.sharedTextureCache.addImage('animation_sprite_sheet.png')
      SpriteFrameCache.frames.add file_name: 'animation_frames.plist', texture: texture
      frame = SpriteFrameCache.frames['bear1.png']
      frame.should.not == nil
      frame.texture.should.not == nil
      frame.rect.should == CGRectMake(237, 443, 233, 145)
    end

    it "should add a frame with texture file" do
      SpriteFrameCache.frames.add file_name: 'animation_frames.plist', texture_file_name: 'animation_sprite_sheet.png'
      frame = SpriteFrameCache.frames['bear1.png']
      frame.should.not == nil
      frame.texture.should.not == nil
      frame.rect.should == CGRectMake(237, 443, 233, 145)
    end
  end

  describe "Remove Frames" do
    before do
      SpriteFrameCache.purge
      SpriteFrameCache.frames.add file_name: 'animation_frames.plist'
    end

    it "should remove frames with name" do
      SpriteFrameCache.frames.remove name: 'bear1.png'
      SpriteFrameCache.frames['bear1.png'].should == nil
    end

    it "should remove frames from a PLIST file" do
      SpriteFrameCache.frames.remove file_name: 'animation_frames.plist'
      SpriteFrameCache.frames['bear2.png'].should == nil
    end

    it "should remove unused frames" do
      SpriteFrameCache.frames.remove_unused_frames
      SpriteFrameCache.frames['bear1.png'].should == nil
    end
  end

  describe "Get Frames" do
    before do
      SpriteFrameCache.purge
      SpriteFrameCache.frames.add file_name: 'animation_frames.plist'
    end

    it "should get a frame by name" do
      SpriteFrameCache.frames['bear1.png'].should.not == nil
    end

    it "should get frames using a prefix & suffix" do
      sprite_frames = SpriteFrameCache.frames.where prefix: "bear", suffix: ".png"
      sprite_frames.each do |frame| 
        frame.texture.should.not == nil
        frame.rect.should.not == CGRectMake(0, 0, 0, 0)
      end
      sprite_frames.size.should == 8
    end

    it "should get frames using a prefix, suffix & from" do
      sprite_frames = SpriteFrameCache.frames.where prefix: "bear", suffix: ".png", from: 5
      sprite_frames.each do |frame| 
        frame.texture.should.not == nil
        frame.rect.should.not == CGRectMake(0, 0, 0, 0)
      end
      sprite_frames.size.should == 4
    end

    it "should get frames using a prefix, suffix, from & to" do
      sprite_frames = SpriteFrameCache.frames.where prefix: "bear", suffix: ".png", from: 5, to: 5
      sprite_frames.each do |frame| 
        frame.texture.should.not == nil
        frame.rect.should.not == CGRectMake(0, 0, 0, 0)
      end
      sprite_frames.size.should == 1
    end

    it "should get frames using a prefix, suffix and order" do
      sprite_frames = SpriteFrameCache.frames.where prefix: "bear", suffix: ".png", order: [1, 5, 3]
      sprite_frames.each do |frame|
        frame.texture.should.not == nil
        frame.rect.should.not == CGRectMake(0, 0, 0, 0)
      end
      sprite_frames.size.should == 3
    end
  end
end
