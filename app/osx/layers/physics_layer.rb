class PhysicsLayer < Joybox::Core::Layer
  
  scene

  def on_enter

    init_physics
    layout_menu
    layout_title

    @sprite_batch = SpriteBatch.new file_name: "sprites/blocks_sprite_sheet.png"
    self << @sprite_batch

    schedule_update do |dt|

      @world.step delta: dt 
    end

    # @audio_effect = AudioEffect.new
    # @audio_effect[:jump] = 'audios/auEffect.wav'

    # @background_audio = BackgroundAudio.new
    # @background_audio[:easy] = 'audios/auBackground.mp3'
    # @background_audio[:hard] = 'audios/auEffect.wav'
    # @background_audio.play :easy
    #p 
    #audio_effects.delete :jump
    # #SimpleAudioEngine.sharedEngine.preloadBackgroundMusic('audios/auBackground.mp3')
    # Audio.background.preload file_name: 'audios/auBackground.mp3'
    # #Audio.background.play file_name: 'audios/auBackground.mp3'
    # Audio.effect.preload file_name: 'audios/auEffect.wav'
    # #Audio.background.stop
    # if Audio.background.playing?
    #    p 'lol'
    # end

    on_mouse_down do |event, button|
      add_new_sprite(event.location)
      # @audio_effects.play :jump
      # @background_audio.rewind
      #@background_audio.play :hard
      #audio_effects.volume = 0.0
       #Audio.background.mute
    end

    on_gesture_begin do |event|
      p 'begin'
    end

    on_gesture_end do |event|
      p 'end'
    end

    on_gesture_swipe do |event|
      p 'swipe'
    end

    on_gesture_magnify do |event|
     # p 'magnify'
    end

    on_gesture_smart_magnify do |event|
      p 'smart'
      Joybox::Audio.enabled = true
      p Joybox::Audio.enabled?
      @background_audio.play
      # audio_id = Audio.effect.play file_name: 'audios/auEffect.wav'

      # Audio.effect.stop audio_id: audio_id

      #Audio.effect.play file_name: 'audios/auEffect.wav'
      #Audio.effect.unload file_name: 'audios/auEffect.wav'
    end

    on_gesture_rotate do |event|
      p 'rotate'
    end

    # @physics_draw = PhysicsDraw.new([:shapes])
    # @world.setDebugDraw(@physics_draw.draw)
  end


  def init_physics

    @world = World.new gravity:[0, -10]

    body = @world.new_body position:[0,0] do

      edge_fixture start_point: [0, 1],
                   end_point: [Screen.width, 1]

      # edge_fixture start_point: [0, Screen.height],
      #              end_point: [Screen.width, Screen.height]

      edge_fixture start_point: [1, Screen.height],
                   end_point: [1, 0]

      edge_fixture start_point: [Screen.width - 1, Screen.height],
                   end_point: [Screen.width - 1, 0]
    end
  end


  def layout_title

    title = Label.new text: 'Tap Screen',
                      font_size: 40,
                      color: Color.new(0, 0, 255),
                      position: [Screen.half_width, Screen.height - 50]

    self << title
  end


  def layout_menu

    MenuLabel.default_font_size = 32

    reset_menu_item = MenuLabel.new text: 'Reset' do |menu_item|

      director.replace_scene(PhysicsLayer.scene)
    end


    menu = Menu.new items: [reset_menu_item],
                    position: [Screen.half_width, Screen.half_height]

    menu.align_items_vertically

    self.add_child(menu, z: 1)
  end

  # def draw
  #   super
  #   ccGLEnableVertexAttribs(KCCVertexAttribFlag_Position)
  #   kmGLPushMatrix
  #   @world.drawDebugData
  #   kmGLPopMatrix
  # end


  def add_new_sprite(position)

    @random ||= Random.new

    block_column = @random.rand > 0.5 ? 0 : 1
    block_row = @random.rand > 0.5 ? 0 : 1

    body = @world.new_body position: position,
                           type: KDynamicBodyType do

                            polygon_fixture box: [16, 16],
                                            friction: 0.3,
                                            density: 1.0

                                            circle_fixture radius: 32,
                                                          friction: 0.3,
                                                          density: 0.3,
                                                          restitution: 0.5
                                            chain_fixture chain: [[10, 10], [20, 20], [30, 30]],
                                                          friction: 0.3,
                                                          density: 0.3,
                                                          restitution: 0.5
    end


    block_sprite = PhysicsSprite.new texture: @sprite_batch.texture,
                                     rect: [[32 * block_column, 32 * block_row], [32, 32]],
                                     body: body,
                                     attack: 1

    @sprite_batch << block_sprite
  end

end
