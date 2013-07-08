module Joybox
  module Actions

    class Visibility

      def self.show
        CCShow.action
      end

      def self.hide
        CCHide.action
      end

      def self.toggle
        CCToggleVisibility.action
      end
      
    end
  
  end
end