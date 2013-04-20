module Joybox
  module Support

    class Scene < Base

      argument :name, :type => :string

      def generate

        layer_folder = File.join(Constants::APP_FOLDER, Constants::SCENES_FOLDER)
        layer_path = File.join(layer_folder, "#{name}_scene.rb")
        template('scene.erb', layer_path)
      end


      def generate_spec

        layer_folder = File.join(Constants::SPEC_FOLDER, Constants::SCENES_FOLDER)
        layer_path = File.join(layer_folder, "#{name}_scene_spec.rb")
        template('scene_spec.erb', layer_path)
      end

    end

  end
end