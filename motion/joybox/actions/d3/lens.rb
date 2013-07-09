module Joybox
  module Actions
    module D3

      class Lens

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
          position = options.delete(:position) || [Screen.half_width, Screen.half_height]
          radius = options.delete(:radius) || Screen.half_width
          CCLens3D.actionWithPosition(position,
                                      radius: radius,
                                      grid: options[:grid_size],
                                      duration: options[:duration])
        end

      end

    end
  end
end