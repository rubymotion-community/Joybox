module Joybox
  module Support

    class Setup < Base

      include Thor::Actions

      def generate_project_structure

        empty_directory(File.join(Constants::APP_FOLDER, Constants::SPRITES_FOLDER))
        empty_directory(File.join(Constants::APP_FOLDER, Constants::LAYERS_FOLDER))
        empty_directory(File.join(Constants::APP_FOLDER, Constants::SCENES_FOLDER))
        empty_directory(File.join(Constants::RESOURCES_FOLDER, Constants::IMAGES_FOLDER))
        empty_directory(File.join(Constants::RESOURCES_FOLDER, Constants::SPRITES_FOLDER))
        empty_directory(File.join(Constants::RESOURCES_FOLDER, Constants::AUDIO_FOLDER))
        empty_directory(File.join(Constants::SPEC_FOLDER, Constants::SPRITES_FOLDER))
        empty_directory(File.join(Constants::SPEC_FOLDER, Constants::LAYERS_FOLDER))
        empty_directory(File.join(Constants::SPEC_FOLDER, Constants::SCENES_FOLDER))
      end


      def generate_clases
        
        app_delegate = AppDelegate.new
        app_delegate.generate
      end

      
      def generate_resources
        
        copy_file('fps_images.png',  File.join(Constants::RESOURCES_FOLDER, 'fps_images.png'))
        copy_file('fps_images-hd.png', File.join(Constants::RESOURCES_FOLDER, 'fps_images-hd.png'))
        copy_file('fps_images-ipadhd.png', File.join(Constants::RESOURCES_FOLDER, 'fps_images-ipadhd.png'))
      end

    end

  end
end