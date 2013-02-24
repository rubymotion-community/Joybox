class MenuLayer < Joybox::Cocos2D::Layer

  include Joybox::Cocos2D::UI

  # TODO: Revisar el nombre de este metodo
  enable_scene


  def on_enter

    layout_title
    layout_menu
  end


  def layout_title

    title_label = Joybox::Cocos2D::UI::Label.new 'Scenes',  
                                                  font_size: 50,
                                                  position: [Screen.half_width, Screen.height - 80],
                                                  color: Color.from_hex('#A24B2C')

    self << title_label
  end


  def layout_menu

    MenuLabel.default_font_size = 40

    cocos_2d_menu_item = MenuLabel.new 'Cocos 2D', 
                                        color: Color.new(162, 75, 44), 
                                        do |menu_item|

    end


    box_2d_button = MenuLabel.new 'Box 2D'


    cocos_motion_button = MenuLabel.new 'Cocos Motion'

    menu = Menu.new items: [cocos_2d_menu_item, box_2d_button, cocos_motion_button],
    position: [Screen.half_width, (Screen.height - 80) / 2]

    menu.align_items_vertically

    self.add_child(menu, z: 1)
  end

end
