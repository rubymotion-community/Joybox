module Joybox
  module Core

    class Sprite < CCSprite

      include Joybox::Common

      alias_method :run_action, :runAction
      alias_method :stop_action, :stopAction
      alias_method :stop_all_actions, :stopAllActions
      alias_method :bounding_box, :boundingBox


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
      
      # Review this in another version, because I dont still quite convinced
      # that this is the correct approach. The alternative is two methods
      # flip_x and flip_y, but I dont like them either.
      def flip(options = {})
        self.flipX = options[:x] if options.include?(:x)
        self.flipY = options[:y] if options.include?(:y)
      end

      def setPosition(position)
        super
      end

      def setContentSize(size)
        super
      end

      def nodeToParentTransform
        super
      end

      def boundingBox
        super
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