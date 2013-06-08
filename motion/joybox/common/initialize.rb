module Joybox
  module Common
    module Initialize
      def new(*args, &block)
        instance = allocate
        instance.send(:initialize, *args, &block)
        instance
      end
    end
  end  
end