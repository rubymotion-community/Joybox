module Joybox
  module Actions
    module D3

      class Flip

        def self.defaults
          {
            duration: 0.3
          }
        end

        def self.x(options = {})
          options = options.nil? ? defaults : defaults.merge!(options)
          CCFlipX3D.actionWithDuration(options[:duration])
        end

        def self.y(options = {})
          options = options.nil? ? defaults : defaults.merge!(options)
          CCFlipY3D.actionWithDuration(options[:duration])
        end

      end

    end
  end
end