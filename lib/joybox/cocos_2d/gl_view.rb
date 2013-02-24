module Joybox
  module Cocos2D

    class GLView < CCGLView

      def self.create_defaults
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


      def self.create(options)

        options = options.nil? ? create_defaults : create_defaults.merge!(options)

        bounds = options[:bounds]

        if bounds.class == Hash

          bounds = [[bounds[:x], bounds[:y]], [bounds[:width], bounds[:height]]]
        end


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