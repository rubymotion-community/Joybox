describe Joybox::UI::MenuImage do
  
  describe "Initialization" do
    it "should initialize with image & selected image" do
      menu_image = MenuImage.new image_file_name: 'sprite.png'

      texture = CCTextureCache.sharedTextureCache.addImage('sprite.png')

      menu_image.should.not == nil
      menu_image.sprite.texture.should == texture
    end

    it "should initialize with image & selected image" do
      menu_image = MenuImage.new image_file_name: 'sprite.png', 
                                 selected_image_file_name: 'sprite_inverted.png'

      texture = CCTextureCache.sharedTextureCache.addImage('sprite.png')
      selected_texture = CCTextureCache.sharedTextureCache.addImage('sprite_inverted.png')

      menu_image.should.not == nil
      menu_image.sprite.texture.should == texture
      menu_image.selected_sprite.texture.should == selected_texture
    end

    it "should initialize with image, selected image & disabled image" do
      menu_image = MenuImage.new image_file_name: 'sprite.png', 
                                 selected_image_file_name: 'sprite_inverted.png',
                                 disabled_image_file_name: 'sprite_inverted.png'

      texture = CCTextureCache.sharedTextureCache.addImage('sprite.png')
      selected_texture = CCTextureCache.sharedTextureCache.addImage('sprite_inverted.png')
      disabled_texture = CCTextureCache.sharedTextureCache.addImage('sprite_inverted.png')

      menu_image.should.not == nil
      menu_image.sprite.texture.should == texture
      menu_image.selected_sprite.texture.should == selected_texture
      menu_image.disabled_sprite.texture.should == disabled_texture
    end
  end

  it "should notify touch" do
    menu_image = MenuImage.new image_file_name: 'sprite.png' do |menu_item|
      texture = CCTextureCache.sharedTextureCache.addImage('sprite.png')

      menu_item.should.not == nil
      menu_image.sprite.texture.should == texture
    end

    menu_image.activate
  end
end