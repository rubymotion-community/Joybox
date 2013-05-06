class HelloWorldLayer < Joybox::Core::Layer

  scene

  def on_enter
    
    sprite_batch = SpriteBatch.new file_name: 'animation/AnimBear.png'

    self << sprite_batch


    SpriteFrameCache.frames.add file_name: 'animation/AnimBear.plist'

    walking_frames = SpriteFrameCache.frames.where prefix: "bear",
                                                   suffix: ".png",
                                                   from: 1

 
    walking_animation = Animation.new frames: walking_frames, 
                                      delay: 0.1


    walking_action = Repeat.forever action: walking_animation.action

    sprite = Sprite.new frame_name: 'bear1.png',
                        position: [Screen.half_width, Screen.half_height]

    sprite.run_action walking_action

    sprite_batch << sprite
  end

end