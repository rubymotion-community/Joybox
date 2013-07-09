Joybox::TMX::TileLayer = CCTMXLayer

class CCTMXLayer
  alias_method :name, :layerName
  alias_method :size, :layerSize
  alias_method :map_size, :mapTileSize
  alias_method :tile_set, :tileset
  alias_method :orientation, :layerOrientation
  alias_method :tile_at, :tileAt

  Orthogonal = 0
  Hexagonal = 1
  Isometric = 2

  
end