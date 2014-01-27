module Joybox
  module Command
    class Image

      def initialize(file_path, suffix)
        @file_path = file_path
        @suffix = suffix
      end

      def scale(scale_factor)
        retina_file_path = File.basename(@file_path, '.*') + @suffix + File.extname(@file_path)

        if File.exists? retina_file_path
          Motion::Project::App.log 'Warning', "Tileset image #{retina_file_path} already exists"
          return
        end

        FileUtils.copy(@file_path, retina_file_path)
        image_height = `sips -g pixelHeight #{retina_file_path}`.scan(/pixelHeight: (\d+)/).last.first
        image_width = `sips -g pixelWidth #{retina_file_path}`.scan(/pixelWidth: (\d+)/).last.first
        `sips -z #{image_height.to_i * scale_factor} #{image_width.to_i * scale_factor} #{retina_file_path}`
      end

    end
  end
end
