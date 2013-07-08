module Joybox
  module Actions
    module D3

      class Jump

        def self.defaults
          {
            duration: 0.3,
            jumps: 1,
            amplitude: 10
          }
        end

        def self.with(options = {})
          # Todo print error message on the console
          return unless options.has_key? :grid_size

          options = options.nil? ? defaults : defaults.merge!(options)
          CCJumpTiles3D.actionWithJumps(options[:jumps],
                                        amplitude: options[:amplitude],
                                        grid: options[:grid_size],
                                        duration: options[:duration])
        end

      end

    end
  end
end