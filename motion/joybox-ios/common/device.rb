# Borrowed from Bubble-wrap: https://github.com/rubymotion/BubbleWrap
# Thank you guys! http://bubble-wrap.io
module Joybox
  module Common

    module Device

      module_function

      def self.simulator?
        @simulator_state ||= !(UIDevice.currentDevice.model =~ /simulator/i).nil?
      end

      def self.iphone?
        UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone
      end

      def self.ipad?
        UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
      end

      def self.retina?
        scale_factor == 2
      end

      def self.scale_factor
        Joybox.director.contentScaleFactor
      end

      def orientation(device_orientation=UIDevice.currentDevice.orientation, fallback=true)
        case device_orientation
        when UIDeviceOrientationPortrait then :portrait
        when UIDeviceceOrientationPortraitUpsideDown then :portrait_upside_down
        when UIDeviceOrientationLandscapeLeft then :landscape_left
        when UIDeviceOrientationLandscapeRight then :landscape_right
        when UIDeviceOrientationFaceUp then :face_up
        when UIDeviceOrientationFaceDown then :face_down
        else
          # In some cases, the accelerometer can't get an accurate read of orientation so we fall back on the orientation of
          # the status bar.
          if fallback && (device_orientation != UIApplication.sharedApplication.statusBarOrientation)
            orientation(UIApplication.sharedApplication.statusBarOrientation)
          else
            :unknown
          end
        end
      end

      def self.os_version
        UIDevice.currentDevice.systemVersion
      end

    end

  end
end