class BackgroundLayer < Joybox::Core::Layer

  def on_enter
    background = Sprite.new file_name: 'images/background.png',
    position: [Screen.half_width, Screen.half_height]
    self << background
  end

end