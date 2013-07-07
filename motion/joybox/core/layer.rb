module Joybox
  module Core

    class Layer < CCLayer

      def self.scene
        define_singleton_method(:scene) do 
          scene = CCScene.new
          menu_layer = self.new
          scene << menu_layer
        end
      end

      def onEnter
        super
        on_enter if defined? (on_enter)
      end

      def onExit
        super
        on_exit if defined? (on_exit)
      end

    end

  end
end