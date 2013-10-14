describe Joybox::Core::KeyboardEvent do
  before do
    class KeyboardEnabledClass; include Joybox::Core::KeyboardEvent; end
    @object = KeyboardEnabledClass.new
  end

  it "should respond to keyboard events" do
    [:down, :up, :flag_changed].each do |event|
      @object.should.respond_to "on_key_#{event}".to_sym
    end
  end
end
