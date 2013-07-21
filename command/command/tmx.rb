require "rexml/document"

module Joybox
  module Command
    class TMX

      include REXML

      def initialize(file_path, suffix)
        @file_path = File.basename(file_path, '.*') + suffix + File.extname(file_path)
        @suffix = suffix
        @map_document = Document.new File.read(file_path)
      end

      def scale(scale_factor)
        @scale_factor = scale_factor

        scale_map(XPath.first(@map_document, "//map"))
        XPath.each(@map_document, "//map/tileset") { |tileset| scale_tileset(tileset) }
        XPath.each(@map_document, "//map/tileset/image") { |image| scale_image(image) }
        XPath.each(@map_document, "//map/objectgroup/object") { |object| scale_object(object) }

        save
      end

      private

        def scale_map(map)
          scale_attribute(map, 'tilewidth')
          scale_attribute(map, 'tileheight')
        end

        def scale_tileset(tileset)
          scale_attribute(tileset, 'tilewidth')
          scale_attribute(tileset, 'tileheight')
          scale_attribute(tileset, 'margin')
          scale_attribute(tileset, 'spacing')
        end

        def scale_image(image)
          scale_attribute(image, 'width')
          scale_attribute(image, 'height')

          image_file = image.attributes['source']

          if File.exists? image_file
            image = Image.new(image_file, @suffix)
            image.scale(@scale_factor)
          else
            Motion::Project::App.log 'Warning', "Tileset image #{image_file} does not exist"
          end
        end

        def scale_object(object)
          scale_attribute(object, 'x')
          scale_attribute(object, 'y')
          scale_attribute(object, 'width')
          scale_attribute(object, 'height')
        end

        def scale_attribute(element, attribute)
          if element.attributes.has_key? attribute
            element.attributes[attribute] = element.attributes[attribute].to_i * @scale_factor
          end
        end

        def save
          File.open(@file_path, "w") do |file|
            file << @map_document
          end
        end

    end
  end
end