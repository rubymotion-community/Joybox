module Joybox
  module Core

    class LayerColor < CCLayerColor

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

      def self.defaults
      {
        opacity: 255,
        width: Screen.width,
        height: Screen.height
      }
      end

      def self.new(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        options[:color] << options[:opacity]

        layer = CCLayerColor.layerWithColor(options[:color], 
                                            width: options[:width], 
                                            height: options[:height])

        layer.position = options[:position] if options.has_key? :position
        layer
      end
      
    end

  end
end