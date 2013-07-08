module Joybox
  module Actions

    class Callback

      def self.with(options = {}, &block)
        if options.has_key?(:object)
          CCCallBlockO.actionWithBlock(block, object: options[:object])
        elsif block.arity == 1
          CCCallBlockN.actionWithBlock(block)
        else
          CCCallBlock.actionWithBlock(block)          
        end
      end

    end
  
  end
end