module Joybox
  module Actions
    module D3

      class Lens

        def self.defaults
          {
            duration: 0.3
          }
        end

        def self.with(options = {})
          # Todo print error message on the console
          return unless options.has_key? :grid_size

          options = options.nil? ? defaults : defaults.merge!(options)
          position = options.delete(:position) || [Common::Screen.half_width, Common::Screen.half_height]
          radius = options.delete(:radius) || Common::Screen.half_width
          CCLens3D.actionWithPosition(position,
                                      radius: radius,
                                      grid: options[:grid_size],
                                      duration: options[:duration])
        end

      end

    end
  end
end