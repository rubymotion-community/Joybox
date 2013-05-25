module Joybox
  module Actions

    class Jump

      def self.defaults
        {
          duration: 0.3,
          position: [0, 0],
          height: 0.0,
          jumps: 1
        }
      end

      def self.by(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        CCJumpBy.actionWithDuration(options[:duration], 
                                    position: options[:position], 
                                    height: options[:height], 
                                    jumps: options[:jumps])
      end

      def self.to(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        CCJumpTo.actionWithDuration(options[:duration], 
                                    position: options[:position], 
                                    height: options[:height], 
                                    jumps: options[:jumps])
      end

    end

  end
end