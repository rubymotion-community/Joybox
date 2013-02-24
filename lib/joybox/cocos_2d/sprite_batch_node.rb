module Joybox
  module Cocos2D

    class SpriteBatchNode < CCSpriteBatchNode

      def self.defaults
        {
          capacity: 100
        }
      end


      def self.new(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        batchNodeWithFile(options[:file_name], 
                          capacity: options[:capacity])
      end

    end

  end
end