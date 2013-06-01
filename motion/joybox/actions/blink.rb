module Joybox
  module Actions

    class Blink

      def self.defaults
        {
          duration: 0.3,
          times: 0
        }
      end

      def self.with(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        CCBlink.actionWithDuration(options[:duration], blinks: options[:times])
      end

    end

  end
end