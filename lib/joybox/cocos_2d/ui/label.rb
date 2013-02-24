module Joybox::Cocos2D::UI

  class Label < CCLabelTTF

    alias_method :text=, :setString
    alias_method :set_text, :setString

    def self.defaults
      {
        font_name: 'Marker Felt',
        font_size: 12
      }
    end


    def self.new(options = {})

      options = options.nil? ? defaults : defaults.merge!(options)

      label = Label.labelWithString(options[:title], 
                                    fontName: options[:font_name], 
                                    fontSize: options[:font_size])

      label.position = options[:position] if options.has_key? (:position)
      label.color = options[:color] if options.has_key? (:color)
        #options[:dimensions] if options.has_key? (:dimensions)
        #label.horizontalAlignment = options[:horizontal_alignment] if options.has_key? (:horizontal_alignment)
        #label.verticalAlignment = options[:vertical_alignment] if options.has_key? (:vertical_alignment)
      label
    end

  end

end