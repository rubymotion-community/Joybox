module Joybox
  module Cocos2D
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


        private 

        def self.new_with_file(options = {})

          self.spriteWithFile(options[:file_name])
        end


        def self.new_with_texture(options = {})

          if options.has_key? (:rect)

            self.spriteWithTexture(options[:texture], rect: options[:rect])
          else

            self.spriteWithTexture(options:[:texture])
          end

        end

      end

    end
  end
end