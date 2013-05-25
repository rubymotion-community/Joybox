module Joybox
  module Actions

    class Move

      def self.defaults
        {
          duration: 0.3,
          position: [0, 0]
        }
      end

      def self.by(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        CCMoveBy.actionWithDuration(options[:duration], 
                                    position: options[:position])
      end

      def self.to(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        CCMoveTo.actionWithDuration(options[:duration], 
                                    position: options[:position])
      end

    end

  end
end