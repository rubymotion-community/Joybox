class GameScene < Joybox::Core::Scene

  def on_enter
    # @player_gorilla = Sprite.new file_name: 'gorilla.png', position: [108, 147], attack: 1, life: 50
    # self << @player_gorilla
    layer_color = LayerColor.new(color: "#800617".to_color, opacity: 255)
    self << layer_color

    layer_color.run_action Blink.with times: 10
  end
end