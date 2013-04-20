module Joybox
  module Support

    class Layer < Base

      argument :name, :type => :string

      def generate

        layer_folder = File.join(Constants::APP_FOLDER, Constants::LAYERS_FOLDER)
        layer_path = File.join(layer_folder, "#{name}_layer.rb")
        template('layer.erb', layer_path)
      end


      def generate_spec

        layer_folder = File.join(Constants::SPEC_FOLDER, Constants::LAYERS_FOLDER)
        layer_path = File.join(layer_folder, "#{name}_layer_spec.rb")
        template('layer_spec.erb', layer_path)
      end

    end

  end
end