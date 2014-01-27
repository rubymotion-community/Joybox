require 'optparse'
require 'command/string'
require 'command/template'

module Motion
  module Project
    class JoyboxGenerateCommand < Command

      self.name = 'joybox:generate'
      self.help = 'Joybox: Class Generator'

      @@description = <<-EOF
    Generates a new class according to the class type and name, those 
    parameters can be sended either CamelCased or snake_cased. Also a 
    test class will be generated and placed inside the spec folder.

    Supported Classes: Sprite, Layer, Scene
      EOF

      @@example = <<-EOF
    'motion jb:generate layer game'

    This will generate a Layer class named 'GameLayer' with the 
    following files:
        class:  'app/layers/game_layer.rb'
        spec:   'spec/layers/game_layer_spec.rb'
      
    The list of posible paths according to the class type:
        Sprite: app/sprites/ - spec/sprites/
        Layer:  app/layers/ - spec/layers/
        Scene:  app/scenes/ - spec/scenes/
      EOF

      def run(args)
        opt_parser = OptionParser.new do |opt|
          opt.banner = "Usage:"
          opt.separator "    motion joybox:generate <class-type> <file-name>"
          opt.separator ""
          opt.separator "Options:"

          opt.on('-h', '--help', 'Shows this screen')

          opt.separator ""
          opt.separator "Description:"
          opt.separator @@description
          opt.separator ""
          opt.separator "Example:"
          opt.separator @@example
        end

        opt_parser.parse!
        return puts opt_parser if args.size != 2

        klass = args[0]
        name = args[1]

        case klass
        when /(\bsprite\b|\blayer\b|\bscene\b)/i
          template = Joybox::Command::Template.new(name, klass)
          template.save
        else
          puts opt_parser
        end
      end

    end
  end
end
