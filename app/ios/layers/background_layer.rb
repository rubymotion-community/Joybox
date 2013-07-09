class BackgroundLayer < Joybox::Core::Layer

  def on_enter
    background_sprite = Sprite.new file_name: 'background.png', position: [Screen.half_width, Screen.half_height]
    self << background_sprite
  end
end