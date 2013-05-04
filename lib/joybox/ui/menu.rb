module Joybox
  module UI

    class Menu < CCMenu

      alias_method :align_items_vertically, :alignItemsVertically
      alias_method :align_items_vertically_width_padding, :alignItemsVerticallyWithPadding
      alias_method :align_items_horizontally, :alignItemsHorizontally
      alias_method :align_items_horizontally_with_padding, :alignItemsHorizontallyWithPadding
      alias_method :align_items_in_columns, :alignItemsInColumns
      alias_method :align_items_in_rows, :alignItemsInRows

      def self.new(options = {})

        menu = self.menuWithArray(options[:items])

        menu.position = options[:position] if options.has_key? (:position)

        menu
      end

    end
    
  end
end