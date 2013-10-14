describe Joybox::Core::GestureEvent do
  before do
    class GestureEnabledClass; include Joybox::Core::GestureEvent; end
    @object = GestureEnabledClass.new
  end

  it "should respond to gesture events" do
    [:begin, :magnify, :smart_magnify, :rotate, :swipe, :end].each do |event|
      @object.should.respond_to "on_gesture_#{event}".to_sym
    end
  end
end
