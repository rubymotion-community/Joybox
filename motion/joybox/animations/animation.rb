module Joybox
  module Animations

  	class Animation < CCAnimation

      alias_method :delay_units, :totalDelayUnits
      alias_method :delay_per_unit, :delayPerUnit
      alias_method :restore_original_frame, :restoreOriginalFrame

      def self.defaults
        {
          frames: nil,
          delay_per_unit: 0.1
        }
      end

      def self.new(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        animation = self.animationWithSpriteFrames(options[:frames])
        animation.delayPerUnit = options[:delay_per_unit] if options.include?(:delay_per_unit)
        animation.totalDelayUnits = options[:delay_units] if options.include?(:delay_units)
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