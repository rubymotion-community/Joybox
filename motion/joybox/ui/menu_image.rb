module Joybox
  module UI

    class MenuImage < CCMenuItemImage

      alias_method :content_size, :contentSize

      def self.new(options = {}, &block)

        menu_item = self.itemWithNormalImage(options[:image_file_name],
                                             selectedImage: options[:selected_image_file_name],
                                             block: block)

        menu_item.position = options[:position] if options.has_key? (:position)

        menu_item
      end

    end

  end
end