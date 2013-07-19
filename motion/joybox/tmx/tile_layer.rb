Joybox::TMX::TileLayer = CCTMXLayer

class CCTMXLayer

  alias_method :name, :layerName
  alias_method :name=, :setLayerName
  alias_method :tiles_size, :layerSize
  alias_method :tiles_size=, :setLayerSize
  alias_method :map_of_tiles, :tiles
  alias_method :map_of_tiles=, :setTiles
  alias_method :tile_set, :tileset
  alias_method :tile_set=, :setTileset
  alias_method :orientation, :layerOrientation
  alias_method :orientation=, :setLayerOrientation
  alias_method :release_map, :releaseMap
  alias_method :setup_tiles, :setupTiles

  Orthogonal = 0
  Hexagonal = 1
  Isometric = 2

  def tile_size
    return mapTileSize unless Device.retina?
    return mapTileSize.half if Device.retina?
  end

  def size
    [layerSize.width * tile_size.width, layerSize.height * tile_size.height].to_size
  end

  def point_for_coordinate(coordinate)
    positionAt(coordinate)
  end

  def coordinate_for_point(point)
    x = point.x / tile_size.width
    y = (size.height - point.y) / tile_size.height
    [x.floor, y.floor].to_point
  end

  def sprite_at(point)
    coordinate = coordinate_for_point(point)
    tileAt(coordinate)
  end

  def tile_type_at(point)
    coordinate = coordinate_for_point(point)
    tileGIDAt(coordinate)
  end

  def remove_tile_at(point)
    coordinate = coordinate_for_point(point)
    removeTileAt(coordinate)
  end

  def set_tile_type_at(point, tile_type)
    coordinate = coordinate_for_point(point)
    setTileGID(tile_type, at: coordinate)
  end

  def [](point)
    coordinate = coordinate_for_point(point)
    tileGIDAt(coordinate)
  end

  def []=(point, tile_type)
    coordinate = coordinate_for_point(point)
    setTileGID(tile_type, at: coordinate)
  end

end