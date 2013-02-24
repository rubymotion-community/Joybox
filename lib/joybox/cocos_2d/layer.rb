module Joybox::Cocos2D

  class Layer < CCLayer

    def self.enable_scene

        define_singleton_method(:scene) do 

          scene = CCScene.new

          menu_layer = self.new

          scene << menu_layer
        end
    end


    def onEnter

      super

      on_enter if defined? (on_enter)
    end

  end

end