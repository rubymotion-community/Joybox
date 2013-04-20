module Joybox
  module Support

    class Generator < Base

      def generate(klass, name)

        klass = Thor::Util.camel_case(klass)
        name = Thor::Util.snake_case(name)
        
        class_generator = Joybox::Support.const_get(klass).new([name])
        class_generator.generate
        class_generator.generate_spec
      end

    end

  end
end