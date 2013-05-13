module Joybox
  module Core

    class Sprites < CCSprite

      attr_accessor :view

      class << self
        alias_method :old_new, :new
      end


      alias_method :old_nodeToParentTransform, :nodeToParentTransform

      def self.new(options={})

        sprite = old_new(options)

        if sprite.boundingBox.size.width < Screen.width

         view = SpriteView.alloc.initWithFrame(sprite.boundingBox)
         view.sprite = sprite

         sprite.view = view

         Object.send(:include, Joybox)

         Joybox.director.view.addSubview(view)

        end

        sprite
      end

      def setPosition(position)
        super

        unless @view.nil?
          @view.frame = self.boundingBox
        end
      end


      def setContentSize(size)
        super

        unless @view.nil?
          @view.frame = self.boundingBox
        end
      end


      def nodeToParentTransform
        return super if @body.nil?
        setPosition(@body.position)
      end

    end


    class SpriteView < NSView

      attr_accessor :sprite

      def to_s
        @sprite.to_s
      end


      def forwardInvocation(invocation)
        if @sprite.respondsToSelector(invocation.selector)
          invocation.invokeWithTarget(@sprite)
        else
          super
        end
      end


      def methodSignatureForSelector(selector)
        if @sprite.respondsToSelector(selector)
          p @sprite.class
          Sprite.class.instanceMethodSignatureForSelector(selector) or @sprite.class.instanceMethodSignatureForSelector(selector)
        else 
          super
        end
      end

    end

  end
end