module Joybox
  module UI

    class Label < CCLabelTTF
      alias_method :text=, :setString
      alias_method :set_text, :setString
      alias_method :text, :string

      TextAlignmentLeft = 0
      TextAlignmentCenter = 1
      TextAlignmentRight = 2

      def defaults
        {
          text: '',
          dimensions: CGSizeZero,
          alignment: TextAlignmentCenter,
          vertical_alignment: KCCVerticalTextAlignmentTop,
          font_name: 'Marker Felt',
          font_size: 12,
          line_break_mode: KCCLineBreakModeWordWrap
        }
      end

      def self.new(options = {})
         instance = allocate
         instance.send(:initialize, options)
         instance
      end

      def initialize(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        self.initWithString(options[:text], 
                            fontName: options[:font_name], 
                            fontSize: options[:font_size],
                            dimensions: options[:dimensions],
                            hAlignment: options[:alignment],
                            vAlignment: options[:vertical_alignment],
                            lineBreakMode: options[:line_break_mode])
        
        self.setString(options[:text])
        self.position = options[:position] if options.has_key? (:position)
        self.color = options[:color] if options.has_key? (:color)
      end
    end

  end
end
