module Joybox
  module UI

    class MenuImage < CCMenuItemImage

      extend Joybox::Common::Initialize
      
      alias_method :sprite, :normalImage
      alias_method :selected_sprite, :selectedImage
      alias_method :disabled_sprite, :disabledImage
      alias_method :content_size, :contentSize

      def initialize(options = {}, &block)
        initWithNormalImage(options[:image_file_name],
                            selectedImage: options[:selected_image_file_name],
                            disabledImage: options[:disabled_image_file_name],
                            block: block)

        self.position = options[:position] if options.has_key? (:position)
      end

    end

  end
end