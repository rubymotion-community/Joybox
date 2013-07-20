class PhysicsLayer < Joybox::Core::Layer
  
  scene

  def on_enter
    init_physics
    #layout_menu
    #layout_title

    @sprite_batch = SpriteBatch.new file_name: "sprites/blocks_sprite_sheet.png"
    self << @sprite_batch

    on_touches_ended do |touches, event|
      touch = touches.any_object
      touch_location = touch.location
      add_new_sprite(touch_location)
    end

    # @audio_effect = AudioEffect.new
    # @audio_effect[:jump] = 'audios/auEffect.wav'

    # @background_audio = BackgroundAudio.new
    # @background_audio[:easy] = 'audios/auBackground.mp3'
    # @background_audio[:hard] = 'audios/auEffect.wav'
    # @background_audio.play :easy

    schedule_update do |dt|
      @world.step delta: dt 
    end
  end


  def init_physics

    @world = World.new gravity:[0, -1]

    body = @world.new_body position:[0,0] do

      edge_fixture start_point: [0, 0],
                   end_point: [Screen.width, 0]

      # edge_fixture start_point: [0, Screen.height - 21],
      #              end_point: [Screen.width, Screen.height - 21]

      edge_fixture start_point: [0, Screen.height],
                   end_point: [0, 0]

      edge_fixture start_point: [Screen.width, Screen.height],
                   end_point: [Screen.width, 0]
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


  def add_new_sprite(position)

    @random ||= Random.new

    block_column = @random.rand > 0.5 ? 0 : 1
    block_row = @random.rand > 0.5 ? 0 : 1

    body = @world.new_body position: position,
                           type: KDynamicBodyType do

      polygon_fixture box: [16, 16],
                      friction: 0.3,
                      density: 1.0

                      # circle_fixture radius: 32,
                      #               friction: 0.3,
                      #               density: 0.3,
                      #               restitution: 0.5
                      # chain_fixture chain: [[10, 10], [20, 20], [30, 30]],
                      #               friction: 0.3,
                      #               density: 0.3,
                      #               restitution: 0.5
    end

    # body = @world.new_body position: position,
    #                        type: Body::Dynamic do

                         

    #                        end

     block_sprite = PhysicsSprite.new texture: @sprite_batch.texture,
                                     rect: [[32 * block_column, 32 * block_row], [32, 32]],
                                     body: body

     block_sprite.position = position
    
     bezier = Bezier.by bezier: [[20, 20], [30, 30], [50, 50]]
     fade = Fade.out
     fade_in = Fade.in
     move = Move.by position: [50, 50]
     rotate = Rotate.by angle:360
     blink = Blink.with times: 10
     liquid = Liquid.with grid_size: [5, 5]

     self.run_action Split.with rows: 2
     block_sprite.run_action Split.with rows: 2#Sequence.with actions:[bezier, fade, fade_in]

     @sprite_batch << block_sprite
  end

end
