class GameLayer < Joybox::Core::Layer

  def on_enter
    @world = World.new gravity: [0.0, -9.8]

    schedule_update do |dt|
      @world.step delta: dt
    end

    @player_gorilla = Sprite.new file_name: 'gorilla.png', position: [108, 147]
    self << @player_gorilla

    body = @world.new_body position: [389, 154] do
      polygon_fixture box: [16, 16], friction: 0.3, density: 1.0
    end

    @enemy_gorilla = PhysicsSprite.new file_name: 'gorilla.png', body: body
    self << @enemy_gorilla
    body[:message] = 'LOL'
    p body[:message]
    body[:message] = "LAL"

    init_controls
  end


  def init_controls
    on_touches_began do |touches, event|
      starting_touch = touches.any_object
      @starting_touch_location = starting_touch.location
    end

    on_touches_ended do |touches, event|
      end_touch = touches.any_object
      end_touch_location = end_touch.location
      banana = new_banana_sprite
      self << banana
      banana.body.apply_force force: (end_touch_location - @starting_touch_location)
    end
  end


  def new_banana_sprite
    banana_body = @world.new_body position: @player_gorilla.position, type: KDynamicBodyType do

        polygon_fixture box: [16, 16],
                        friction: 0.3,
                        density: 1.0
    end 

    @banana_sprite = PhysicsSprite.new file_name: 'banana.png', body: banana_body

    @world.when_collide banana_body do |collision_body, is_touching|
      @banana_sprite.file_name = 'banana_hit.png'
      @enemy_gorilla.file_name = 'gorilla_hit.png'
    end

    @banana_sprite
  end
end