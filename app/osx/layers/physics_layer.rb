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

    on_mouse_down do |event, button|

      add_new_sprite(event.location)
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

      circle_fixture radius: 30

      chain_fixture loop: [[0, 0], [20, 20], [40, 40]]
    end


    # block_sprite = PhysicsSprite.new texture: @sprite_batch.texture,
    #                                  rect: [[32 * block_column, 32 * block_row], [32, 32]],
    #                                  body: body

    # @sprite_batch << block_sprite
  end

end
