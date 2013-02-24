module Joybox
  module Cocos2D
    module Actions

      class Sequence

        def self.defaults
          {
            items: []
          }
        end

        def self.new(options = {})

          options = options.nil? ? defaults : defaults.merge!(options)

          CCSequence.actionsWithArray(options[:items])
        end
        
      end

    end
  end
end