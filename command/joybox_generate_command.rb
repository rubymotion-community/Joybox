require 'optparse'
require 'command/string'
require 'command/template'

module Joybox
  module Command
    class Generate < Base

      self.arguments = 'CLASS-TYPE FILE-NAME'
      self.summary = 'Class Generator'
      self.description = <<-EOF
    Generates a new class according to the class type and name, those 
    parameters can be sended either CamelCased or snake_cased. Also a 
    test class will be generated and placed inside the spec folder.

    Supported Classes: Sprite, Layer, Scene

    Example: $ motion joybox generate layer game

    This will generate a Layer class named 'GameLayer' with the
    following files:
        class:  'app/layers/game_layer.rb'
        spec:   'spec/layers/game_layer_spec.rb'

    The list of posible paths according to the class type:
        Sprite: app/sprites/ - spec/sprites/
        Layer:  app/layers/ - spec/layers/
        Scene:  app/scenes/ - spec/scenes/
      EOF

      def initialize(argv)
        @class_type = argv.shift_argument
        @file_name = argv.shift_argument
        super
      end

      def validate!
        super
        help! "A CLASS-TYPE is required." unless @class_type
        help! "Invalid CLASS-TYPE specified." unless @class_type =~ /(\bsprite\b|\blayer\b|\bscene\b)/i
        help! "A FILE-NAME is required." unless @file_name
      end

      def run
        template = Joybox::Command::Template.new(@file_name, @class_type)
        template.save
      end

    end
  end
end
