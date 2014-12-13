require 'optparse'
require 'command/tmx'
require 'command/image'

module Joybox
  module Command
    class Retina < Base

      include Joybox::Command

      RetinaSuffix = '-hd'
      RetinaScaleFactor = 2.0

      self.summary = 'Retina Generator'
      self.description = <<-EOF
    Generates a retina version for a image or tmx files

    For images it will scale the original image and save it with the suffix
    -hd. Please note that is only for testing purposes it will not increase
    the image quality.

    For TMX files it will scale the Map, Tileset and Object information to
    2x and save it with the -hd suffix. Also if the Tileset is found it will
    be scaled and saved with the same suffix.

    Example: $ motion joybox retina tile_map.tmx

    This will create a new file named tile_map-hd.tmx, update its Map, Tileset
    and Object properties and create the according retina images with the -hd
    suffix.
      EOF

      self.arguments = 'FILE-NAME'

      def self.options
        [
          ['--suffix=SUFFIX', 'Retina suffix (default: -hd)'],
          ['--scale=SCALE',   'Retina scale (default: 2.0)'],
        ].concat(super)
      end

      def initialize(argv)
        @suffix = argv.option('suffix') || RetinaSuffix
        @scale_factor = argv.option('scale')
        @scale_factor = @scale_factor.nil? ? RetinaScaleFactor : @scale_factor.to_f

        @file_name = argv.shift_argument
        case @file_name
        when /\w+.tmx/i
          @file_type = :tmx
        when /([^\s]+(\.(?i)(jpg|jpeg|png|gif|bmp))$)/i
          @file_type = :image
        end

        super
      end

      def validate!
        super
        unless @file_name && File.exist?(@file_name)
          help! "An existing FILE-NAME is required."
        end
        unless [:tmx, :image].include?(@file_type)
          help! "Invalid FILE-NAME specified, should be a TMX or image file."
        end
      end

      def run
        case @file_type
        when :tmx
          document = TMX.new(file_name, suffix)
          document.scale(scale_factor)
        when :image
          image = Image.new(file_name, suffix)
          image.scale(scale_factor)
        end
      end

    end
  end
end
