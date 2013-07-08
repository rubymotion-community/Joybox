module Joybox
  module Actions

    class Liquid

      def self.defaults
        {
          duration: 0.3,
          waves: 1,
          amplitude: 10
        }
      end

      def self.with(options = {})
        # Todo print error message on the console
        return unless options.has_key? :grid_size

        options = options.nil? ? defaults : defaults.merge!(options)
        CCLiquid.actionWithWaves(options[:waves],
                                 amplitude: options[:amplitude],
                                 grid: options[:grid_size],
                                 duration: options[:duration])
      end

    end

  end
end