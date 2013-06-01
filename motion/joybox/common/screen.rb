module Joybox
  module Common

    module Screen

      module_function

      def self.width
        Joybox.director.winSize.width
      end

      def self.half_width
        Joybox.director.winSize.width / 2
      end

      def self.height
        Joybox.director.winSize.height
      end

      def self.half_height
        Joybox.director.winSize.height / 2
      end

    end

  end
end