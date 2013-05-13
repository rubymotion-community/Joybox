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

        Object.send(:include, Joybox) if options[:repl]
        Sprite.send(:include, Joybox::Debug::Node) if options[:repl]

        Joybox::Debug.repl = options[:repl]
        Joybox::Debug.bounding_box = options[:bounding_box]
      end 

    end

  end
end