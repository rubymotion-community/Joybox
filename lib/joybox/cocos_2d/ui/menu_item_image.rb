module Joybox::Cocos2D::UI

  class MenuItemImage < CCMenuItemImage

    def self.defaults
      {
        normal_image: nil,
        selected_image: nil,
      }
    end


    def self.new(options = {}, &block)

      options = options.nil? ? defaults : defaults.merge!(options)

      menu_item = self.itemWithNormalImage(options[:normal_image],
                                           selectedImage: options[:selected_image],
                                           block: block)
    end

  end

end