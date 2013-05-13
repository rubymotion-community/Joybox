class ActionsLayer < Joybox::Core::Layer

  def on_enter
    layout_characters
  end

  def layout_characters
    @first_character = Sprite.new file_name: 'sprites/character_horn_girl.png',
    position: [773, 100]
    self << @first_character

    @second_character = Sprite.new file_name: 'sprites/character_pink_girl.png',
    position: [300, 400]
    self << @second_character

    @third_character = Sprite.new file_name: 'sprites/character_boy.png',
    position: [250, 400]
    self << @third_character
  end 
end