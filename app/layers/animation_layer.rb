# Temporal: It should be moved to his own example proyect
# Thank you Ray Wenderlich for the amazing tutorial and Vicki Wenderlich for the wonderful art
# Translated from: http://www.raywenderlich.com/32045/how-to-use-animations-and-sprite-sheets-in-cocos2d-2-x
# Art: http://www.vickiwenderlich.com
class AnimationLayer < Joybox::Core::Layer

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