module Joybox
  module Actions

    class Bezier

      def self.defaults
        {
          duration: 0.3,
          bezier: [[0,0], [0, 0], [0, 0]]
        }
      end

      def self.by(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        CCBezierBy.actionWithDuration(options[:duration], 
                                      bezier: options[:bezier])
      end


      def self.to(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        CCBezierTo.actionWithDuration(options[:duration], 
                                      bezier: options[:bezier])
      end

    end

  end
end