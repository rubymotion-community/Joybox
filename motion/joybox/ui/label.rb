module Joybox
  module UI

    class Label < CCLabelTTF
      alias_method :text=, :setString
      alias_method :set_text, :setString

      TextAlignmentLeft = 0
      TextAlignmentCenter = 1
      TextAlignmentRight = 2

      def self.defaults
        {
          text: '',
          dimensions: CGSizeZero,
          alignment: TextAlignmentCenter,
          font_name: 'Marker Felt',
          font_size: 12
        }
      end

      def self.new(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        label = Label.labelWithString(options[:text],
          dimensions: options[:dimensions],
          hAlignment: options[:alignment],
          fontName: options[:font_name],
          fontSize: options[:font_size]
        )

        label.position = options[:position] if options.has_key? (:position)
        label.color = options[:color] if options.has_key? (:color)

        label
      end
    end

  end
end
