class ActionsLayer < Joybox::Core::Layer

  def on_enter
    layout_characters
  end

  def layout_characters
    @first_character = Sprite.new file_name: 'sprites/character_horn_girl.png',
    position: [210, 190]
    self << @first_character
  end 

end