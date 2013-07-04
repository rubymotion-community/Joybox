module Joybox
  module Debug
    module REPL

      class << self
        attr_accessor :active
        attr_accessor :bounding_box
      end

      def self.included(base)
        base.send(:attr_accessor, :proxy_view)
        base.send(:attr_accessor, :bounding_box_layer)
      end

      def cleanup
        @proxy_view.removeFromSuperview
        super
      end

      def translated_bounding_box
        bounding_box = boundingBox
        bounding_box.origin = bounding_box.origin.from_opengl_coordinates
        bounding_box.origin.y = bounding_box.origin.y - bounding_box.size.height
        bounding_box
      end

      def setPosition(position)
        super
        update_bounding_box
      end

      def setContentSize(size)
        super
        @proxy_view.removeFromSuperview if boundingBox.size.width == Screen.width
        update_bounding_box
      end

      def nodeToParentTransform
        update_bounding_box
        super
      end


      private

      def update_bounding_box
        initialize_proxy_view if @proxy_view.nil?
        @proxy_view.frame = translated_bounding_box unless @proxy_view.nil?
        @bounding_box_layer.frame = @proxy_view.bounds unless @bounding_box_layer.nil?
      end

      def initialize_proxy_view
        @proxy_view = ProxyView.alloc.initWithFrame(translated_bounding_box)
        @proxy_view.userInteractionEnabled = false
        @proxy_view.node = self
        Joybox.director.view.addSubview(@proxy_view)

        initialize_bounding_box_layer if Joybox::Debug::REPL.bounding_box
      end

      def initialize_bounding_box_layer
        @bounding_box_layer = CALayer.layer
        @bounding_box_layer.borderColor = UIColor.greenColor.CGColor
        @bounding_box_layer.borderWidth = 2
        @bounding_box_layer.frame = translated_bounding_box

        @proxy_view.layer.addSublayer(@bounding_box_layer)
      end

    end
  end
end