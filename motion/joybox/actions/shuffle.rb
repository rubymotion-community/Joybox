module Joybox
  module Actions

    class Shuffle

      def self.defaults
        {
          duration: 0.3
        }
      end

      def self.with(options = {})
        # Todo print error message on the console
        return unless options.has_key? :grid_size

        options = options.nil? ? defaults : defaults.merge!(options)
        seed = options.delete(:seed) || Joybox.generate_seed
        CCShuffleTiles.actionWithDuration(options[:duration],
                                          size: options[:grid_size],
                                          seed: seed)
      end

    end

  end
end