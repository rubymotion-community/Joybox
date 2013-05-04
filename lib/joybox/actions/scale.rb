module Joybox
  module Actions

    class Scale

      def self.defaults
        {
          duration: 0.3,
          scale: 0
        }
      end

      def self.by(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        CCScaleBy.actionWithDuration(options[:duration], 
                                      scale: options[:scale])
      end


      def self.to(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        CCScaleTo.actionWithDuration(options[:duration],
                                      scale: options[:scale])
      end

    end

  end
end