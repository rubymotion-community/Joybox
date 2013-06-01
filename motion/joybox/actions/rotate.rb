module Joybox
  module Actions

    class Rotate

      def self.defaults
        {
          duration: 0.3,
          angle: 0
        }
      end

      def self.by(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        CCRotateBy.actionWithDuration(options[:duration], angle: options[:angle])
      end

      def self.to(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        CCRotateTo.actionWithDuration(options[:duration], angle: options[:angle])
      end

    end

  end
end