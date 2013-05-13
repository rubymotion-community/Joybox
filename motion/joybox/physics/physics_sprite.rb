# TODO: Revisar el nombre de esto
module Joybox
  module Core

    class PhysicsSprite < Sprite

      attr_accessor :body

      def self.new(options = {})
        sprite = super 
        sprite.body = options[:body] if options.include? :body

        sprite
      end

      # We need this method to return true, so Cocos2d continue
      # to call the nodeToParentTransform method
      def dirty
        true 
      end

      def position=(position)
        @body.position = position
      end

      def position
        @body.position.from_pixel_coordinates
      end

      def nodeToParentTransform
        return super if @body.nil?

        super
        
        position = @body.position.from_pixel_coordinates
        position = position + anchorPointInPoints if ignoreAnchorPointForPosition
        angle = @body.angle

        x = position.x
        y = position.y
        cosine = Math.cos(angle)
        sine = Math.sin(angle)

        unless anchorPointInPoints == CGPointZero
          x = x + cosine * -anchorPointInPoints.x + -sine * -anchorPointInPoints.y
          y = y + sine * -anchorPointInPoints.x + cosine * -anchorPointInPoints.y        
        end

        CGAffineTransformMake(cosine, sine, -sine, cosine, x, y)
      end

    end

  end
end