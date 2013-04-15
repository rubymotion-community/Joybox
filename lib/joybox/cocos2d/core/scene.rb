module Joybox
  module Core

    class Scene < CCScene

      def onEnter

        super

        on_enter if defined? (on_enter)
      end


      def onExit

        super

        on_exit if defined? (on_exit)
      end

    end

  end
end