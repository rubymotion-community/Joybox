module Joybox
  module UI

    class MenuLabel < CCMenuItemFont

      extend Joybox::Common::Initialize

      # Class Method Alias Method
      class << self
        alias_method :default_font_size, :fontSize
        alias_method :default_font_size=, :setFontSize
        alias_method :default_font_name, :fontName
        alias_method :default_font_name=, :setFontName
      end

      # Property Alias Method
      alias_method :font_size, :fontSize
      alias_method :font_size=, :setFontSize
      alias_method :font_name, :fontName
      alias_method :font_name=, :setFontName
      alias_method :text=, :setString
      alias_method :set_text, :setString

      def defaults
        {
          text: ''
        }
      end

      def initialize(options = {}, &block)
        options = options.nil? ? defaults : defaults.merge!(options)
        initWithString(options[:text], block: block)
        self.font_size = options[:font_size] if options.has_key? (:font_size)
        self.fontName = options[:font_name] if options.has_key? (:font_name)
        self.color = options[:color] if options.has_key? (:color)
        self.position = options[:position] if options.has_key? (:position)
      end

      def text
        self.label.string
      end

    end

  end
end