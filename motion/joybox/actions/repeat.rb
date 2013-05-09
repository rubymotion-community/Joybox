module Joybox
  module Actions

    class Repeat

      def self.defaults
        {
          action: nil,
          times: 0
        }
      end

      #TODO: Revisar esto, no estoy completamente seguro que deba de cambiar la implementacion
      #      original (nombre del metodo)
      def self.forever(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        CCRepeatForever.actionWithAction(options[:action])
      end

      def self.with(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCRepeat.actionWithAction(options[:action], 
                                  times:options[:times])
      end

    end

  end
end
