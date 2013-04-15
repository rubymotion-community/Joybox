class Box2DLayer < Joybox::Core::Layer

  include Joybox

  enable_scene

  def on_enter

    init_physics
    layout_menu
    layout_title

    @sprite_batch_node = SpriteBatchNode.new file_name: "box2d/blocks_sprite_sheet.png"
    self << @sprite_batch_node


    on_touches_ended do |touches, event|

      touch = touches.any_object

      touch_location = touch.location_in_touch_view.to_opengl_coordinates

      add_new_sprite(touch_location)
    end


    schedule_update do |dt|

      @world.step delta: dt 
    end
  end


  def init_physics

    @world = World.new gravity:[0, -10]

    body = @world.new_body position:[0,0] do

      edge_fixure start_point: [0, 0],
                  end_point: [Screen.width.to_pixels, 0]

      edge_fixure start_point: [0, Screen.height.to_pixels],
                  end_point: [Screen.width.to_pixels, Screen.height.to_pixels]

      edge_fixure start_point: [0, Screen.height.to_pixels],
                  end_point: [0, 0]

      edge_fixure start_point: [Screen.width.to_pixels, Screen.height.to_pixels],
                  end_point: [Screen.width.to_pixels, 0]
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

    reset_menu_item = MenuLabel.new 'Reset' do |menu_item|

      director.replace_scene(Box2DLayer.scene)
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

    body = @world.new_body position: position.to_pixel_coordinates,
                           type: KDynamicBodyType do

        polygon_fixure box: [0.5, 0.5],
                       friction: 0.3,
                       density: 1.0

    end


    block_sprite = PhysicsSprite.new texture: @sprite_batch_node.texture,
                                     rect: [[32 * block_column, 32 * block_row], [32, 32]],
                                     position: position

    block_sprite.physics_body = body

    @sprite_batch_node << block_sprite
  end

end
