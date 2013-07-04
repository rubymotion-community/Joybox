module Joybox
  module Debug

  	class ProxyView < UIView

      attr_accessor :node

      def to_s
        @node.to_s
      end

      def position
        @node.position
      end

      def position=(position)
        @node.position = position
      end

      def method_missing(method, *args, &block)
        if @node.respond_to?(method)
          @node.send(method, *args, &block)
        else
          raise NoMethodError  
        end
      end
      
    end

  end
end