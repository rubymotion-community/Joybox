module Joybox
  module Common
    module Initialize
      def new(options = {})
        instance = allocate
        instance.send(:initialize, options)
        instance
      end
    end
  end  
end