module Joybox
  module Actions

    class Spawn

      def self.defaults
        {
          actions:[]
        }
      end

      def self.with(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        CCSpawn.actionWithArray(options[:actions])
      end
      
    end

  end
end