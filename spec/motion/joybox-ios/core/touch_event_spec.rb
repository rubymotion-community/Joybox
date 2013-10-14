describe Joybox::Core::TouchEvent do
  before do
    class TouchEnabledClass; include Joybox::Core::TouchEvent; end
    @object = TouchEnabledClass.new
  end

  it "should respond to touch events" do
    [:began, :moved, :ended, :cancelled].each do |event|
      @object.should.respond_to "on_touches_#{event}".to_sym
    end
  end
end
