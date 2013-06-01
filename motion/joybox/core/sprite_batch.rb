module Joybox
  module Core

    class SpriteBatch < CCSpriteBatchNode

      extend Joybox::Common::Initialize

      def defaults
        {
          capacity: 29
        }
      end

      def initialize(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        initialize_with_file_name(options) if options.has_key? (:file_name)
        initialize_with_texture(options) if options.has_key? (:texture)
      end

      private

      def initialize_with_file_name(options = {})
        initWithFile(options[:file_name], capacity: options[:capacity])
      end

      def initialize_with_texture(options = {})
        initWithTexture(options[:texture], capacity: options[:capacity])
      end

    end

  end
end