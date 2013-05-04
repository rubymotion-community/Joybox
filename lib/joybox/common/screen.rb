# TODO: Revisar
# 1 => Dependencia entre modulos por el director
# 2 => Usar una clase o un modulo para este escenario, se usa un modulo
#      debido a que Screen no tendra estado
# 3 => El nombrado de half
module Joybox
  module Common

    module Screen

      module_function

      def self.width

        CCDirector.sharedDirector.winSize.width
      end


      def self.half_width

        CCDirector.sharedDirector.winSize.width / 2
      end


      def self.height

        CCDirector.sharedDirector.winSize.height
      end


      def self.half_height

        CCDirector.sharedDirector.winSize.height / 2
      end

    end

  end
end