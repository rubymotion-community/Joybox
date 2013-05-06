module Joybox
  module UI

    class MenuLabel < CCMenuItemFont

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

      def self.defaults
        {
          text: ''
        }
      end

      def self.new(options = {}, &block)

        options = options.nil? ? defaults : defaults.merge!(options)

        menu_item = self.itemWithString(options[:text], block: block)

        menu_item.font_size = options[:font_size] if options.has_key? (:font_size)
        menu_item.fontName = options[:font_name] if options.has_key? (:font_name)
        menu_item.color = options[:color] if options.has_key? (:color)
        menu_item.position = options[:position] if options.has_key? (:position)

        menu_item
      end

    end

  end
end