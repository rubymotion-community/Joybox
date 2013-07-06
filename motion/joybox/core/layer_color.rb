module Joybox
  module Core

    class LayerColor < CCLayerColor
      def onEnter
        super
        on_enter if defined?(on_enter)
      end

      def onExit
        super
        on_exit if defined?(on_exit)
      end

      def self.new(options = {})
        color4b = CcColor4B.new
        color4b.r = options[:red] || 0
        color4b.g = options[:green] || 0
        color4b.b = options[:blue] || 0
        color4b.a = options[:opacity] || 255

        layer = CCLayerColor.layerWithColor(
          color4b,
          width: options[:width] || Screen.width,
          height: options[:height] || Screen.height
        )

        layer.position = options[:position] || CGPointZero
        layer
      end
    end

  end
end