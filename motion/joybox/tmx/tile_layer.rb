Joybox::TMX::TileLayer = CCTMXLayer

class CCTMXLayer

  alias_method :name, :layerName
  alias_method :tiles_size, :layerSize
  alias_method :tile_set, :tileset
  alias_method :orientation, :layerOrientation

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
    y = size.height - point.y / tile_size.height
    [x, y].to_point
  end

  def sprite_at_coordinate(coordinate)
    tileAt(coordinate)
  end

  def tile_identifier_at_coordinate(coordinate)
    tileGIDAt(coordinate)
  end

end