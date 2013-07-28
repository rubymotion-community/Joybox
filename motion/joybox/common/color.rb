module Joybox
  module Common

    class Color < Array

      def self.defaults
        {
          red: 255,
          green: 255,
          blue: 255
        }
      end

      def initialize(red, green, blue)
        self.push(red, green, blue)
      end

      def self.create(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        self.new(options[:red], options[:green], options[:blue])
      end

      def self.from_rgb(red, green, blue)
        self.new(red, green, blue)
      end

      def self.from_hex(hex)
        split_hex = [hex.delete(' ').delete('#')].pack('H*').unpack('C*')

        red = split_hex[0]
        green = split_hex[1]
        blue = split_hex[2]
        
        self.new(red, green, blue)
      end

      def red
        self[0]
      end

      def green
        self[1]
      end

      def blue
        self[2]
      end
    end

  end
end