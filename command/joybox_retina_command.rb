require 'optparse'
require 'command/tmx'
require 'command/image'

module Motion
  module Project
    class JoyboxRetinaCommand < Command

      include Joybox::Command

      RetinaSuffix = '-hd'
      RetinaScaleFactor = 2.0

      self.name = 'joybox:retina'
      self.help = 'Joybox: Retina Generator'

      @@description = <<-EOF
    Generates a retina version for a image or tmx files

    For images it will scale the original image and save it with the suffix
    -hd. Please note that is only for testing purposes it will not increase
    the image quality.

    For TMX files it will scale the Map, Tileset and Object information to
    2x and save it with the -hd suffix. Also if the Tileset is found it will
    be scaled and saved with the same suffix.
      EOF

      @@example = <<-EOF
    motion joybox:retina tile_map.tmx

    This will create a new file named tile_map-hd.tmx, update its Map, Tileset
    and Object properties and create the according retina images with the -hd
    suffix.
    EOF

      def run(args)
        options = Hash.new

        opt_parser = OptionParser.new do |opt|
          opt.banner = "Usage:"
          opt.separator "    motion joybox:retina <file-name>"
          opt.separator ""
          opt.separator "Options:"

          opt.on('-s', '--suffix <suffix>', 'Retina suffix (default: -hd)') do |suffix|
            options[:suffix] = suffix
          end
          opt.on('-%', '--scale <scale>', Float, 'Retina scale (default: 2.0)') do |scale_factor|
            options[:scale_factor] = scale_factor
          end
          opt.on('-h', '--help', 'Shows this screen')

          opt.separator ""
          opt.separator "Description:"
          opt.separator @@description
          opt.separator ""
          opt.separator "Example:"
          opt.separator @@example
        end

        opt_parser.parse!(args)

        file_path = args[0]
        suffix = options[:suffix] || RetinaSuffix
        scale_factor = options[:scale_factor] || RetinaScaleFactor

        unless file_path.nil? or File.exists? file_path
          App.log 'Error', "#{file_path} does not exist"
          return
        end

        case file_path
        when /\w+.tmx/i
          document = TMX.new(file_path, suffix)
          document.scale(scale_factor)
        when /([^\s]+(\.(?i)(jpg|jpeg|png|gif|bmp))$)/i
          image = Image.new(file_path, suffix)
          image.scale(scale_factor)
        else
          puts opt_parser
        end
      end

    end
  end
end
