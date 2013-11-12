module Joybox
  module Core

    class LayerGradient < CCLayerGradient

      include Joybox::Common

      def self.scene
        define_singleton_method(:scene) do |options = {}|
          scene = CCScene.new
          layer = self.new(options)
          scene << layer
        end
      end

      def self.defaults
        {
          vector: [0, -1]
        }
      end

      def initialize(options = {})
        options = self.class.defaults.merge(options)

        layer = self.initWithColor(options[:start],
                                   fadingTo: options[:end],
                                   alongVector: options[:vector])

        layer.position = options[:position] if options[:position]
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
