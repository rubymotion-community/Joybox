module Joybox
  module Core

    class Layer < CCLayer

      include MouseEvent
      include KeyboardEvent
      include GestureEvent

    end

  end
end
