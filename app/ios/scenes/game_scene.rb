class GameScene < Joybox::Core::Scene

  def on_enter
    background_layer = BackgroundLayer.new
    self << background_layer
    game_layer = GameLayer.new
    self << game_layer
  end
end