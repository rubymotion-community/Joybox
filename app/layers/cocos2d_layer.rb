class Cocos2DLayer < Joybox::Cocos2D::Core::Layer

  include Joybox::Cocos2D::UI

  enable_scene

  def on_enter

    title = Label.new text: 'Hello World',
                      font_size: 64,
                      position: [Screen.half_width, Screen.half_height]

    self << title

  end

end