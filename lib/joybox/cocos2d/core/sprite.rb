module Joybox
  module Core

    class Sprite < CCSprite

      alias_method :run_action, :runAction
      alias_method :stop_action, :stopAction
      alias_method :stop_all_actions, :stopAllActions


      def self.new(options = {})

        sprite ||= new_with_file_name(options) if options.has_key? (:file_name)
        sprite ||= new_with_texture(options) if options.has_key? (:texture)
        sprite ||= new_with_frame_name(options) if options.has_key? (:frame_name)

        sprite.position = options[:position] if options.has_key? (:position)

        sprite
      end

      def file_name=(file_name)

        texture = CCTextureCache.sharedTextureCache.addImage(file_name)
        self.setTexture(texture)
      end

      private 

      def self.new_with_file_name(options = {})

        spriteWithFile(options[:file_name])
      end


      def self.new_with_texture(options = {})

        if options.has_key? (:rect)

          spriteWithTexture(options[:texture], rect: options[:rect])
        else

          spriteWithTexture(options:[:texture])
        end

      end


      def self.new_with_frame_name(options = {})

        spriteWithSpriteFrameName(options[:frame_name])
      end

    end

  end
end