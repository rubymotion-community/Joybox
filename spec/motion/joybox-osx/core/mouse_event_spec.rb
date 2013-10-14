describe Joybox::Core::MouseEvent do
  before do
    class MouseEnabledClass; include Joybox::Core::MouseEvent; end
    @object = MouseEnabledClass.new
  end

  it "should respond to mouse events" do
    [:down, :dragged, :up, :moved, :entered, :exited, :scroll].each do |event|
      @object.should.respond_to "on_mouse_#{event}".to_sym
    end
  end
end
