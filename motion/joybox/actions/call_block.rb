module Joybox
  module Actions

    class CallBlock
      def self.with(&block)
        CCCallBlockN.actionWithBlock(block)
      end
    end

  end
end
