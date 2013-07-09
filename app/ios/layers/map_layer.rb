class MapLayer < Joybox::Core::Layer

  include Joybox::TMX

  scene
  #centered_at :player

  def on_enter
    @tile_map = TileMap.new file_name: 'TileMap.tmx'
    @background = @tile_map.tile_layers[:Background]
    @tile_map["objects=>Spawn"]
    @tile_map.layer 'Objects=>Spawn'
    @tile_map[:tiles, :Background]
    @spawn = @tile_map.object_layers[:Spawn][:SpawnPoint][:vida]
    @x = @tile_map.object 'Spawn=>SpawnPoint=>x'

    x = @tile_map.where :object_layer => 'Spawn', :object => 'SpawnPoint', :key => 'x'
    y = @tile_map.where :object_layer => 'Spawn', :object => 'SpawnPoint', :key => 'y'

    @player = Sprite.new position: [x, y], file_name: 'Player.png'

    self << @tile_map
    self << @player
    center_at(@player.position)

    on_touches_ended do |touches, event|
      location =  touches.any_object.location
      location = self.convertToNodeSpace(location)

      position = @player.position
      diff =  location - @player.position

      #@player.position = @tile_map.step_by(position, new_position)
      if diff.x.abs > diff.y.abs
        position.x += @tile_map.tile_size.width if diff.x > 0
        position.x -= @tile_map.tile_size.width unless diff.x > 0
      else
        position.y += @tile_map.tile_size.height if diff.y > 0
        position.y -= @tile_map.tile_size.height unless diff.y > 0
      end

      @player.position = position if @tile_map.contains_point? position
      center_at(@player.position)
    end
  end

  def center_at(position)
    x = [position.x, Screen.width / 2].max
    y = [position.y, Screen.height / 2].max
    x = [x, @tile_map.size.width - Screen.width / 2].min
    y = [y, @tile_map.size.height - Screen.height / 2].min

    self.position = Screen.center - [x, y].to_point
  end

end