module Joybox
  module Actions

    class Turn

      def self.defaults
        {
          duration: 0.3
        }
      end

      def self.off(options = {})
        # Todo print error message on the console
        return unless options.has_key? :grid_size

        options = options.nil? ? defaults : defaults.merge!(options)
        seed = options.delete(:seed) || Joybox.generate_seed
        CCTurnOffTiles.actionWithSeed(seed, grid: options[:grid_size], duration: options[:duration])
      end

    end

  end
end