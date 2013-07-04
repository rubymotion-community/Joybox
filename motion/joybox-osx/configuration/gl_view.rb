module Joybox
  module Configuration

    class GLView < CCGLView

      attr_accessor :resize_to_superview

      def self.defaults
        {
          bounds: [[0, 0], [0, 0]],
          auto_resize_mask: NSViewHeightSizable | NSViewWidthSizable
        }
      end


      def self.new(options)
        bounds_provided = options != nil and options.include?(:bounds)
        options = options.nil? ? defaults : defaults.merge!(options)
        bounds = options[:bounds]

        if bounds.class == Hash
          bounds = [[bounds[:x], bounds[:y]], [bounds[:width], bounds[:height]]]
        end

        opengl_view = alloc.initWithFrame(bounds)

        #opengl_view.pixelFormat = KCCTexture2DPixelFormat_RGBA8888
        opengl_view.setAutoresizingMask(options[:auto_resize_mask])
        opengl_view.resize_to_superview = !bounds_provided
        opengl_view
      end

      def initWithFrame(frame)
        if super
          tracking_options = NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways | NSTrackingInVisibleRect
          tracking_area = NSTrackingArea.alloc.initWithRect(self.bounds,
                                                            options: tracking_options,
                                                            owner: self,
                                                            userInfo: nil)
          addTrackingArea(tracking_area)
        end
        self
      end

      # This method will be called when we insert the view in the content view
      # of the window.
      # Setting the frame of the superview will make posible to don't require
      # the bounds on the setup.
      # Notes:
      # => In the case the user provides the bounds in the setup, it will honor
      #    it.
      def viewDidMoveToSuperview
        if @resize_to_superview
          self.frame = superview.bounds unless superview.nil?
          Joybox.director.originalWinSize = self.frame.size
          @resize_to_superview = false
        end
      end
    end
    
  end
end