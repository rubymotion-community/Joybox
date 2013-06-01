describe Joybox::Core::SpriteBatch do

  describe "Initialization" do
    it "should initialize with file name" do 
      sprite_batch = SpriteBatch.new file_name: 'sprite_sheet.png'
      sprite_batch.should.not == nil
      sprite_batch.texture.should.not == nil
      sprite_batch.textureAtlas.should.not == nil
    end

    it "should initialize with file name and capacity" do 
      sprite_batch = SpriteBatch.new file_name: 'sprite_sheet.png', capacity: 50
      sprite_batch.should.not == nil
      sprite_batch.texture.should.not == nil
      sprite_batch.textureAtlas.should.not == nil
      sprite_batch.textureAtlas.capacity.should == 50
    end

    it "should initialize with texture" do
      texture = CCTextureCache.sharedTextureCache.addImage('sprite_sheet.png')
      sprite_batch = SpriteBatch.new texture: texture
      sprite_batch.should.not == nil
      sprite_batch.texture.should.not == nil
    end

    it "should initialize with texture and capacity" do
      texture = CCTextureCache.sharedTextureCache.addImage('sprite_sheet.png')
      sprite_batch = SpriteBatch.new texture: texture, capacity: 50
      sprite_batch.should.not == nil
      sprite_batch.texture.should.not == nil
      sprite_batch.textureAtlas.capacity.should == 50
    end
  end
end