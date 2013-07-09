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
      alias_method :tile_size, :tileSize
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

      def [](kind, key)
        return layerNamed(key) if kind == :tile
        return objectGroupNamed(key) if kind == :object
      end

      def where(options = {})
        return query_object_layers(options) if options.has_key? :object_layer
      end

      def tile_layers
        TileLayers.new(self)
      end

      def object_layers
        ObjectLayers.new(self)
      end

      def size
        [mapSize.width * tileSize.width, mapSize.height * tileSize.height].to_size
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

      private

      def query_object_layers(options = {})
        object_layer = objectGroupNamed(options[:object_layer])
        return object_layer unless options.has_key? :object
        object = object_layer[options[:object]] 
        return object unless options.has_key? :key
        object[options[:key]]
      end

    end
  end
end