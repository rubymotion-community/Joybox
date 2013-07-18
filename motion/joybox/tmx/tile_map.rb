module Joybox
  module TMX

    class ObjectLayers
      def initialize(map); @map = map; end
      def [](key); @map.objectGroupNamed(key); end
    end

    class TileLayers
      def initialize(map); @map = map; end
      def [](key); @map.layerNamed(key); end
    end

    class TileMap < CCTMXTiledMap

      extend Joybox::Common::Initialize

      alias_method :tiles_size, :mapSize
      alias_method :orientation, :mapOrientation
      alias_method :objects, :objectGroups
      alias_method :properties_for_gid, :propertiesForGID

      Orthogonal = 0
      Hexagonal = 1
      Isometric = 2

      Tile = :tile
      Object = :object

      def initialize(options = {})
        # Todo print error message on the console
        return unless [:file_name, :xml].any? { |k| options.has_key? k }

        initWithTMXFile(options[:file_name]) unless options.has_key? :xml
        initWithXML(options[:xml], resourcePath: options[:resource_path]) unless options.has_key? :file_name
      end

      def object(query)
        keys = query.split('#')
        key = keys.shift

        layer = objectGroupNamed(key) unless key.nil?
        return layer unless key = keys.shift
        object = layer[key]
        return object unless key = keys.shift

        if key.casecmp(:position)
          position = [object[:x], object[:y]].to_point
          position = position.half if Device.retina?
          position
        else
          object[key]
        end
      end

      def tile_layers
        TileLayers.new(self)
      end

      def object_layers
        ObjectLayers.new(self)
      end

      def tile_size
        return tileSize unless Device.retina?
        return tileSize.half if Device.retina?
      end

      def size
        [mapSize.width * tile_size.width, mapSize.height * tile_size.height].to_size
      end

      def bounding_box
        [position.x, position.y, size.width, size.height].to_rect
      end

      def contains_point?(point)
        CGRectContainsPoint(bounding_box, point)
      end

      def coordinate_for_point(point)
        x = point.x / tile_size.width
        y = size.height - point.y / tile_size.height
        [x, y].to_point
      end

      def step_by(position, new_position)
        delta =  new_position - position
        if delta.x.abs > delta.y.abs
          position.x += tile_size.width if delta.x > 0
          position.x -= tile_size.width unless delta.x > 0
        else
          position.y += tile_size.height if delta.y > 0
          position.y -= tile_size.height unless delta.y > 0
        end
        position
      end

    end
  end
end