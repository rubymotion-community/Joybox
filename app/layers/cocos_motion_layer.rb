# A Joybox translate of the Cocos Motion example created by:
#
# Sean Scally => https://github.com/scally
# Ricardo Quesada => https://github.com/ricardoquesada
# Cocos Motion => https://github.com/scally/cocosmotion
#
# Thank you guys!
class CocosMotionLayer < Joybox::Cocos2D::Core::Layer

  include Joybox::Cocos2D

  enable_scene

  def on_enter

    layout_sprites

    layout_title

    layout_menu

    simple_sprite_animation
  end


  def layout_sprites

    @left_sprite = Sprite.new file_name:'cocos_motion/grossinis_sister.png',
                              position: [Screen.width / 4 * 1, Screen.half_height]

    @center_sprite = Sprite.new file_name:'cocos_motion/grossini.png',
                                position: [Screen.width / 4 * 2, Screen.half_height]

    @right_sprite = Sprite.new file_name:'cocos_motion/grossinis_sister_two.png',
                               position: [Screen.width / 4 * 3, Screen.half_height]

    self.add_childs(@left_sprite, @center_sprite, @right_sprite)
  end


  def layout_title

    @title = Label.new font_name: 'Arial',
                       font_size: 32,
                       position: [Screen.half_width, Screen.height - 50]


    @subtitle = Label.new font_name: 'Arial',
                          font_size: 16,
                          position: [Screen.half_width, Screen.height - 80]


    self.add_childs(@title, @subtitle)
  end


  def layout_menu

    back_item = MenuImage.new image: 'cocos_motion/left_arrow.png',
                                selected_image: 'cocos_motion/left_arrow_selected.png' do |menu_item|
                                  
                                  skew_sprite_animation
                                end

    reset_item = MenuImage.new image: 'cocos_motion/dot.png',
                                selected_image: 'cocos_motion/dot_selected.png' do |menu_item|

                                  director.replace_scene(CocosMotionLayer.scene)
                                end

    next_item = MenuImage.new image: 'cocos_motion/right_arrow.png',
                                selected_image: 'cocos_motion/right_arrow_selected.png' do |menu_item|

                                  simple_sprite_animation
                                end


    menu = Menu.new items: [back_item, reset_item, next_item],
                    position: [0, 0]

    back_item.position = [Screen.half_width - reset_item.content_size.double_width, 
                          reset_item.content_size.half_height]

    reset_item.position = [Screen.half_width, 
                          reset_item.content_size.half_height]

    next_item.position = [Screen.half_width + reset_item.content_size.double_width, 
                          reset_item.content_size.half_height]

    self << menu
  end


  def simple_sprite_animation

    @title.text = 'Basic Actions'
    @subtitle.text = 'Rotate, Scale and Translate actions'

    @left_sprite.stop_all_actions
    @center_sprite.stop_all_actions
    @right_sprite.stop_all_actions

    rotate = Rotate.by duration: 2, angle:360
    rotate_reverse = rotate.reverse
    rotate_sequence = Sequence.new items: [rotate, rotate_reverse]

    scale = Scale.by duration: 2, scale:4
    scale_reverse = scale.reverse
    scale_sequence = Sequence.new items: [scale, scale_reverse]

    move = Move.by duration: 2, position: [-200, 0]
    move_reverse = move.reverse
    move_sequence = Sequence.new items: [move, move_reverse]

    @left_sprite.run_action(Repeat.forever action:rotate_sequence)
    @center_sprite.run_action(Repeat.forever action:scale_sequence)
    @right_sprite.run_action(Repeat.forever action:move_sequence)
  end


  def skew_sprite_animation

    @title.text = 'Skew Actions'
    @subtitle.text = 'Testing skew actions'

    @left_sprite.stop_all_actions
    @center_sprite.stop_all_actions
    @right_sprite.stop_all_actions

    first_skew = Skew.by duration:2, x:37, y:-37
    first_skew_reverse = first_skew.reverse
    first_sequence = Sequence.new items: [first_skew, first_skew_reverse]

    second_skew = Skew.by duration:2, x:0, y:-90
    second_skew_reverse = second_skew.reverse
    second_sequence = Sequence.new items: [second_skew, second_skew_reverse]

    third_skew = Skew.by duration:2, x:45, y:45
    third_skew_reverse = third_skew.reverse
    third_sequence = Sequence.new items: [third_skew, third_skew_reverse]

    @left_sprite.run_action(Repeat.forever action:first_sequence)
    @center_sprite.run_action(Repeat.forever action:second_sequence)
    @right_sprite.run_action(Repeat.forever action:third_sequence)
  end

end