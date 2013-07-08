module Joybox
  module Actions
    module D3

      class Shatter

        def self.defaults
          {
            duration: 0.3,
            range: 10,
            shatter_z: true
          }
        end

        def self.with(options = {})
          # Todo print error message on the console
          return unless options.has_key? :grid_size

          options = options.nil? ? defaults : defaults.merge!(options)
          CCShatteredTiles3D.actionWithDuration(options[:duration],
                                                size: options[:grid_size],
                                                range: options[:range],
                                                shatterZ: options[:shatter_z])
        end

      end

    end
  end
end