module Joybox
  module Configuration

    class GLView < CCGLView

      def self.defaults
        {
          bounds: UIScreen.mainScreen.bounds,
          pixel_format: KEAGLColorFormatRGB565,
          depth_format: 0,
          preserve_backbuffer: 0,
          share_group: nil,
          multi_sampling: false,
          number_of_samples: 0
        }
      end

      def self.new(options)
        options = options.nil? ? defaults : defaults.merge!(options)
        bounds = options[:bounds]

        bounds = [[bounds[:x], bounds[:y]], [bounds[:width], bounds[:height]]] if bounds.class == Hash

        GLView.viewWithFrame(UIScreen.mainScreen.bounds,
         pixelFormat: options[:pixel_format],
         depthFormat: options[:depth_format],
         preserveBackbuffer: options[:preserve_backbuffer],
         sharegroup: options[:share_group],
         multiSampling: options[:multi_sampling],
         numberOfSamples: options[:number_of_samples])
      end

    end
    
  end
end