module Joybox
  module Core

    module GestureEvent

      # Gesture Events
      gesture_states = [:begin, :magnify, :smart_magnify, :rotate, :swipe, :end]

      gesture_states.each do |gesture_state|
        define_method("on_gesture_#{gesture_state}") do |&block|
          self.gestureEnabled = true if block_given?
          instance_variable_set("@on_gesture_#{gesture_state}_block", block)
        end
      end

      def ccBeginGestureWithEvent(event)
        @on_gesture_begin_block.call(event) if @on_gesture_begin_block
        @on_gesture_begin_block ? true : false
      end

      def ccMagnifyWithEvent(event)
        @on_gesture_magnify_block.call(event) if @on_gesture_magnify_block
        @on_gesture_magnify_block ? true : false
      end

      def ccSmartMagnifyWithEvent(event)
        @on_gesture_smart_magnify_block.call(event) if @on_gesture_smart_magnify_block
        @on_gesture_smart_magnify_block ? true : false
      end

      def ccRotateWithEvent(event)
        @on_gesture_rotate_block.call(event) if @on_gesture_rotate_block
        @on_gesture_rotate_block ? true : false
      end

      def ccSwipeWithEvent(event)
        @on_gesture_swipe_block.call(event) if @on_gesture_swipe_block
        @on_gesture_swipe_block ? true : false
      end

      def ccEndGestureWithEvent(event)
        @on_gesture_end_block.call(event) if @on_gesture_end_block
        @on_gesture_end_block ? true : false
      end

    end

  end
end

