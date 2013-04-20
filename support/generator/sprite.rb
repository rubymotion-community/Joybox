module Joybox
  module Support

    class Sprite < Base

      argument :name, :type => :string

      def generate

        layer_folder = File.join(Constants::APP_FOLDER, Constants::SPRITES_FOLDER)
        layer_path = File.join(layer_folder, "#{name}_sprite.rb")
        template('sprite.erb', layer_path)
      end


      def generate_spec

        layer_folder = File.join(Constants::SPEC_FOLDER, Constants::SPRITES_FOLDER)
        layer_path = File.join(layer_folder, "#{name}_sprite_spec.rb")
        template('sprite_spec.erb', layer_path)
      end

    end

  end
end