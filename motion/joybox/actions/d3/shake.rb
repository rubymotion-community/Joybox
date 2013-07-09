module Joybox
  module Actions
    module D3

      class Shake

        def self.defaults
          {
            duration: 0.3,
            range: 10,
            shake_z: true
          }
        end

        def self.with(options = {})
          # Todo print error message on the console
          return unless options.has_key? :grid_size

          options = options.nil? ? defaults : defaults.merge!(options)
          klass = options[:tiled] ? CCShakyTiles3D : CCShaky3D
          
          klass.actionWithRange(options[:range],
                                shakeZ: options[:shake_z],
                                grid: options[:grid_size],
                                duration: options[:duration])
        end

      end

    end
  end
end