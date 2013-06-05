module Joybox
  module Common
    module Initialize
      def new(*args)
        instance = allocate
        instance.send(:initialize, *args)
        instance
      end
    end
  end  
end