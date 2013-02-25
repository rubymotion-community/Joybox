class MenuLayer < Joybox::Cocos2D::Core::Layer

  include Joybox::Cocos2D

  # TODO: Revisar el nombre de este metodo
  enable_scene


  def on_enter

    layout_title
    layout_menu
  end


  def layout_title

    title_label = Label.new  text: 'Scenes', 
                             font_size: 50,
                             position: [Screen.half_width, Screen.height - 80],
                             color: Color.from_hex('#4AA419')

    self << title_label
  end


  def layout_menu

    MenuLabel.default_font_size = 40

    cocos_2d_menu_item = MenuLabel.new 'Cocos 2D', 
                                        color: Color.new(252, 253, 167), 
                                        do |menu_item|

      director.replace_scene(Cocos2DLayer.scene)
    end


    box_2d_button = MenuLabel.new 'Box 2D',
                                  color: Color.from_hex('82CCFB'),
                                  do |menu_item|

      director.replace_scene(Box2DLayer.scene)
    end


    cocos_motion_button = MenuLabel.new 'Cocos Motion',
                                         color: Color.from_hex('FE7058'),
                                         do |menu_item|

      director.replace_scene(CocosMotionLayer.scene)
    end


    menu = Menu.new items: [cocos_2d_menu_item, box_2d_button, cocos_motion_button],
                     position: [Screen.half_width, (Screen.height - 80) / 2]

    menu.align_items_vertically

    self.add_child(menu, z: 1)
  end

end
