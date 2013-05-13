class GameScene < Joybox::Core::Scene

  def on_enter
    background_layer = BackgroundLayer.new
    self << background_layer

    actions_layer = ActionsLayer.new
    self << actions_layer
  end

end