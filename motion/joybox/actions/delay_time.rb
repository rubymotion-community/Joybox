module Joybox
  module Actions

    class DelayTime
      def self.defaults
        {
          duration: 1
        }
      end

      def self.by(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        CCDelayTime.actionWithDuration (options[:duration])
      end
    end

  end
end


