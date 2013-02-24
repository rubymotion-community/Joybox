module Joybox
  module Cocos2D
    module Actions

      class Skew

        def self.defaults
          {
            duration: 0.3,
            x: 0,
            y: 0
          }
        end

        def self.by(options = {})

          options = options.nil? ? defaults : defaults.merge!(options)

          CCSkewBy.actionWithDuration(options[:duration], 
                                      skewX: options[:x],
                                      skewY: options[:y])
        end


        def self.to(options = {})

          options = options.nil? ? defaults : defaults.merge!(options)

          CCSkewTo.actionWithDuration(options[:duration], 
                                      skewX: options[:x],
                                      skewY: options[:y])
        end

      end

    end
  end
end