module Joybox
  module UI

    class Menu < CCMenu

      extend Joybox::Common::Initialize

      alias_method :align_items_vertically, :alignItemsVertically
      alias_method :align_items_vertically_width_padding, :alignItemsVerticallyWithPadding
      alias_method :align_items_horizontally, :alignItemsHorizontally
      alias_method :align_items_horizontally_with_padding, :alignItemsHorizontallyWithPadding
      alias_method :align_items_in_columns, :alignItemsInColumnsWithArray
      alias_method :align_items_in_rows, :alignItemsInRowsWithArray

      # action alias methods
      alias_method :run_action, :runAction
      alias_method :stop_action, :stopAction
      alias_method :stop_all_actions, :stopAllActions

      def initialize(options = {})
        initWithArray(options[:items])
        self.position = options[:position] if options.has_key? (:position)
      end

    end
    
  end
end