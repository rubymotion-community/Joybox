class MapLayer < Joybox::Core::Layer

  include Joybox::TMX

  scene
  #centered_at :player

  def on_enter
    @tile_map = TileMap.new file_name: 'TileMap.tmx'
    @background = @tile_map.tile_layers[:Background]
    @spawn = @tile_map.object_layers[:Spawn][:SpawnPoint][:vida]

    position = @tile_map.object 'Spawn#SpawnPoint#Position'

    @player = Sprite.new position: position, file_name: 'Player.png'

    self << @tile_map
    self << @player

    center_at(@player.position)

    p Device.os_version

    on_touches_ended do |touches, event|
      location =  touches.any_object.location
      location = self.convertToNodeSpace(location)

      position = @tile_map.step_by(@player.position, location)

      @player.position = position if @tile_map.contains_point? position
      center_at(@player.position)
    end
  end



end