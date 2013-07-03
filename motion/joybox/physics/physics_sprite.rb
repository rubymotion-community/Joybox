module Joybox
  module Physics

    class PhysicsSprite < Joybox::Core::Sprite

      attr_accessor :body

      def initialize(options = {})
        super
        self.body = options[:body] if options.include? :body
      end

      # We need this method to return true, so Cocos2d continue
      # to call the nodeToParentTransform method
      def dirty
        true 
      end

      def position=(position)
        if @body
          @body.position = position
        else
          super
        end
      end

      def position
        if @body
          @body.position
        else
          super
        end
      end

      def nodeToParentTransform
        return super if @body.nil?

        super

        position = @body.position
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

        rotated_transform = CGAffineTransformMake(cosine, sine, -sine, cosine, x, y)
        CGAffineTransformScale(rotated_transform, self.scaleX, self.scaleY)
      end

    end

  end
end
