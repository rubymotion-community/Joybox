module Joybox
  module Animations

  	class Animation < CCAnimation

      alias_method :total_delay, :totalDelayUnits
      alias_method :delay, :delayPerUnit
      alias_method :restore_original_frame, :restoreOriginalFrame

      def self.defaults
        {
          frames: nil
        }
      end


      def self.new(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        animation = self.animationWithSpriteFrames(options[:frames])
        animation.delayPerUnit = options[:delay] if options.include?(:delay)
        animation.totalDelayUnits = options[:total_delay] if options.include?(:total_delay)
        animation.duration = options[:duration] if options.include?(:duration)
        animation.restoreOriginalFrame = options[:restore_original_frame] if options.include?(:restore_original_frame)
        animation.loops = options[:loops] if options.include?(:loops)

        animation
      end


      def add_frame(options = {})

        if options.has_key? (:frame)

          addSpriteFrame(options[:frame]) if options.has_key? (:frame)

        elsif options.has_key? (:file_name)

          addSpriteFrameWithFilename(options[:file_name])
        
        elsif options.has_key? (:texture) and options.has_key? (:rect)

          addSpriteFrameWithTexture(options[:texture], rect: options[:rect])
        end

        # Check if it should fail silently or crash if any of the options
        # above are sended
      end


      def action

        CCAnimate.actionWithAnimation(self)
      end

    end

  end
end