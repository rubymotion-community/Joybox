module Joybox
  module Configuration

    class Debug

      def self.default_configuration
        {
          repl: false,
          bounding_box: false
        }
      end

      def self.configure(options = {})
        options = options.nil? ? default_configuration : default_configuration.merge!(options)
        options[:repl] = true if options[:bounding_box]

        Object.send(:include, Joybox)
        Sprite.send(:include, Joybox::Debug::REPL) if options.has_key? :repl
        Layer.send(:include, Joybox::Debug::Physics) if options.has_key? :physics

        Joybox::Debug::REPL.active = options[:repl]
        Joybox::Debug::REPL.bounding_box = options[:bounding_box]
        Joybox::Debug::Physics.modes = options[:physics]
      end 

    end

  end
end