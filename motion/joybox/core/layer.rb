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

      def schedule_update(&block)
        @schedule_update_block = block if block_given?
        scheduleUpdate
      end

      def update(dt)
        @schedule_update_block.call(dt) if @schedule_update_block
      end

    end

  end
end