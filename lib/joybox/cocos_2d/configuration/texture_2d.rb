module Joybox
  module Cocos2D
    module Configuration

      class Texture2D < CCTexture2D

        def self.default_configuration
          {

            default_alpha_pixel_format: KCCTexture2DPixelFormat_RGBA8888,
            pvr_images_have_premultiplied_alpha: true

          }
        end


        def self.configure(options = {})

          options = options.nil? ? default_configuration : default_configuration.merge!(options)

          defaultAlphaPixelFormat = options[:default_alpha_pixel_format] 
          PVRImagesHavePremultipliedAlpha(options[:pvr_images_have_premultiplied_alpha])
        end

      end

    end
  end
end
