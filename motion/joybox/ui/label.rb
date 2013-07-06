module Joybox
  module UI

    class Label < CCLabelTTF

      extend Joybox::Common::Initialize

      alias_method :text=, :setString
      alias_method :set_text, :setString
      alias_method :text, :string
      alias_method :alignment, :horizontalAlignment
      alias_method :alignment=, :setHorizontalAlignment
      alias_method :vertical_alignment, :verticalAlignment
      alias_method :vertical_alignment=, :setVerticalAlignment
      alias_method :font_name, :fontName
      alias_method :font_name=, :setFontName
      alias_method :font_size, :fontSize
      alias_method :font_size=, :setFontSize

      # action alias methods
      alias_method :run_action, :runAction
      alias_method :stop_action, :stopAction
      alias_method :stop_all_actions, :stopAllActions

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

      def initialize(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        self.initWithString(options[:text], 
                            fontName: options[:font_name], 
                            fontSize: options[:font_size],
                            dimensions: options[:dimensions],
                            hAlignment: options[:alignment],
                            vAlignment: options[:vertical_alignment],
                            lineBreakMode: options[:line_break_mode])
        
        self.position = options[:position] if options.has_key? (:position)
        self.color = options[:color] if options.has_key? (:color)
      end
    end

  end
end
