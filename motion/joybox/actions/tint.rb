module Joybox
  module Actions

    class Tint

      def self.defaults
        {
          duration: 0.3,
          color: Common::Color.from_rgb(1, 1, 1)
        }
      end

      def self.by(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        CCTintBy.actionWithDuration(options[:duration], 
                                    red: options[:color].red, 
                                    green: options[:color].green, 
                                    blue: options[:color].blue)
      end

      def self.to(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        CCTintTo.actionWithDuration(options[:duration], 
                                    red: options[:color].red, 
                                    green: options[:color].green, 
                                    blue: options[:color].blue)
      end

    end

  end
end