class MapLayer < Joybox::Core::Layer
  include Joybox::TMX
  scene

  def on_enter
    @tile_map = TileMap.new file_name: 'TileMap.tmx'
    @background = @tile_map.tile_layers[:Background]
    @foreground = @tile_map.tile_layers[:Foreground]
    @meta = @tile_map.tile_layers[:Meta]
    @meta.visible = false

    position = @tile_map.object 'Objects#SpawnPoint#Position'

    @player = Sprite.new position: position, file_name: 'Player.png'

    self << @tile_map
    self << @player

    center_at(@player.position)

    on_gesture_swipe do |event|
      p 'magnify'
    end

    on_mouse_down do |event, button|
      location =  event.location.to_local_coordinates(self)
      position = @tile_map.step_by(@player.position, location)

      set_position(position) if @tile_map.contains_point? position
      center_at(@player.position)
    end
  end

  def set_position(position)
    tile_type = @meta[position]
    tile_properties = @tile_map.tiles[tile_type]

    return if tile_properties[:Collidable]

    if tile_properties[:Collectable]
      @meta.remove_tile_at(position)
      @foreground.remove_tile_at(position)
    end

    @background[position] = 15
    @player.position = position 
  end

end