module Joybox
  module Core

    class Sprite < CCSprite

      alias_method :stop_all_actions, :stopAllActions
      alias_method :run_action, :runAction

      def self.new(options = {})

        sprite ||= new_with_file(options) if options.has_key? (:file_name)
        sprite ||= new_with_texture(options) if options.has_key? (:texture)

        sprite.position = options[:position] if options.has_key? (:position)

        sprite
      end

      def file_name=(file_name)

        texture = CCTextureCache.sharedTextureCache.addImage(file_name)
        self.setTexture(texture)
      end

      private 

      def self.new_with_file(options = {})

        spriteWithFile(options[:file_name])
      end


      def self.new_with_texture(options = {})

        if options.has_key? (:rect)

          spriteWithTexture(options[:texture], rect: options[:rect])
        else

          spriteWithTexture(options:[:texture])
        end

      end

    end

  end
end