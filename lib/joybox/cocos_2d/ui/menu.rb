module Joybox::Cocos2D::UI

  class Menu < CCMenu

    alias_method :align_items_vertically, :alignItemsVertically

    def self.new(options = {})

      menu = self.menuWithArray(options[:items])

      menu.position = options[:position] if options.has_key? (:position)

      menu
    end

  end
  
end