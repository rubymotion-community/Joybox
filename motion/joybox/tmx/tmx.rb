module Joybox
  module TMX
    
    include Joybox::Common

    def center_at(position)
      x = [position.x, Screen.half_width].max
      y = [position.y, Screen.half_height].max
      x = [x, @tile_map.size.width - Screen.half_width].min
      y = [y, @tile_map.size.height - Screen.half_height].min

      self.position = Screen.center - [x, y].to_point
    end

  end
end