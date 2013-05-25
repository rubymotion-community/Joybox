module Joybox
  module Actions

    class Sequence

      def self.defaults
        {
          actions:[]
        }
      end

      def self.with(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        CCSequence.actionWithArray(options[:actions])
      end
      
    end

  end
end