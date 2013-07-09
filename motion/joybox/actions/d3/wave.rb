module Joybox
  module Actions
    module D3

      class Wave

        def self.defaults
          {
            duration: 0.3,
            waves: 1,
            amplitude: 10,
            tiled: false
          }
        end

        def self.with(options = {})
          # Todo print error message on the console
          return unless options.has_key? :grid_size

          options = options.nil? ? defaults : defaults.merge!(options)
          klass = options[:tiled] ? CCWavesTiles3D : CCWaves3D
          
          klass.actionWithWaves(options[:waves],
                                amplitude: options[:amplitude],
                                grid: options[:grid_size],
                                duration: options[:duration])
        end

      end

    end
  end
end