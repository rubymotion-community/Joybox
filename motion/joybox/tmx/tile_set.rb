Joybox::TMX::TileSet = CCTMXTilesetInfo

class CCTMXTilesetInfo
  
  include Joybox::Common
  
  alias_method :first_tile_type, :firstGid
  alias_method :first_tile_type, :setFirstGid
  alias_method :image_file_name, :sourceImage
  alias_method :image_file_name=, :setSourceImage
  alias_method :image_size, :imageSize
  alias_method :image_size=, :setImageSize
  alias_method :tile_offset, :tileOffset
  alias_method :tile_offset=, :setTileOffset
  alias_method :anchor_point, :tileAnchorPoint

  def tile_size
    return tileSize unless Device.retina?
    return tileSize.half if Device.retina?
  end

  def rect_for_tile_type(tile_type)
    rectForGID(tile_type)
  end

end