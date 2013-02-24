module Joybox::Cocos2D::UI

  class Menu < CCMenu

    alias_method :align_items_vertically, :alignItemsVertically

    def self.new(options = {})

      self.menuWithArray(options[:items])
    end

  end
  
end