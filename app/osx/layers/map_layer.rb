class MapLayer < Joybox::Core::Layer
  scene

  def on_enter
    @tile_map = CCTMXTiledMap.tiledMapWithTMXFile('TileMap.tmx')
    @background = @tile_map.layerNamed('Background')

    self << @tile_map
  end

end