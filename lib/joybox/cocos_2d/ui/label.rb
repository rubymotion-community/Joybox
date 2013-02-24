module Joybox::Cocos2D::UI

  class Label < CCLabelTTF

    def self.defaults
      {
        font_name: 'Marker Felt',
        font_size: 12,
        position: [0, 0],
        color: [1, 1, 1]
      }
    end


    def self.new(title, options = {})

      options = options.nil? ? defaults : defaults.merge!(options)

      label = Label.labelWithString(title, 
        fontName: options[:font_name], 
        fontSize: options[:font_size])

      label.position = options[:position]
      label.color = options[:color]
        #options[:dimensions] if options.has_key? (:dimensions)
        #label.horizontalAlignment = options[:horizontal_alignment] if options.has_key? (:horizontal_alignment)
        #label.verticalAlignment = options[:vertical_alignment] if options.has_key? (:vertical_alignment)
      label
    end

  end

end