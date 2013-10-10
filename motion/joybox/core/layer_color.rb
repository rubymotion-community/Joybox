module Joybox
  module Core

    class LayerColor < CCLayerColor

      include Joybox::Common

      def self.scene
        define_singleton_method(:scene) do |options = {}|
          scene = CCScene.new
          layer = self.new(options)
          scene << layer
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

      def self.defaults
        {
          opacity: 255,
          width: Screen.width,
          height: Screen.height
        }
      end

      def self.new(options = {})
        opts = defaults.merge(options)

        layer = self.layerWithColor(Array[*opts[:color], opts[:opacity]],
                                    width: opts[:width],
                                    height: opts[:height])

        layer.position = opts[:position] if opts[:position]
        layer
      end

    end

  end
end
