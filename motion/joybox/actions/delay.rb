module Joybox
  module Actions

    class Delay
      
      def self.defaults
        {
          by: 1
        }
      end

      def self.time(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        CCDelayTime.actionWithDuration(options[:by])
      end
    end

  end
end