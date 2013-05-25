module Joybox
  module Actions

    class Place

      def self.defaults
        {
          position: [0, 0]
        }
      end

      def self.in(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        CCPlace.actionWithPosition(options[:position])
      end

    end

  end
end