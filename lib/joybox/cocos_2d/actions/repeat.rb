module Joybox
  module Cocos2D
    module Actions

      class Repeat

        def self.defaults
          {
            action: nil
          }
        end

        #TODO: Revisar esto, no estoy completamente seguro que deba de cambiar la implementacion
        #      original (nombre del metodo)
        def self.forever(options = {})

          options = options.nil? ? defaults : defaults.merge!(options)

          CCRepeatForever.actionWithAction(options[:action])
        end
        
      end

    end
  end
end