module Joybox
  module Actions

    class Fade

      def self.defaults
        {
          duration: 0.3,
          opacity: 0
        }
      end

      def self.in(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        CCFadeIn.actionWithDuration(options[:duration])
      end

      def self.out(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        CCFadeOut.actionWithDuration(options[:duration])
      end

      def self.to(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        CCFadeTo.actionWithDuration(options[:duration],
                                    opacity: options[:opacity])
      end

    end
  end
end