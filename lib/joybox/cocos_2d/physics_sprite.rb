# TODO: Revisar el nombre de esto
module Joybox::Cocos2D

  class PhysicsSprite < Sprite

    attr_accessor :physics_body

    # We need this method to return true, so Cocos2d continue
    # to call the nodeToParentTransform method
    def dirty

      true
    end


    def nodeToParentTransform

      position = @physics_body.position.to_coordinates

      position = position + anchorPointInPoints if ignoreAnchorPointForPosition

      angle = @physics_body.angle

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