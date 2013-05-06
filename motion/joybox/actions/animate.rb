module Joybox
  module Actions

    class Animate

      def self.defaults
        {
          animation: nil
        }
      end

      def self.with(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        CCAnimate.actionWithAnimation(options[:animation])
      end

    end

  end
end