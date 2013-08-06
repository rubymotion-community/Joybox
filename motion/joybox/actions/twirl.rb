module Joybox
  module Actions

    class Twirl

      def self.defaults
        {
          duration: 0.3,
          twirls: 1,
          amplitude: 3
        }
      end

      def self.with(options = {})
        # Todo print error message on the console
        return unless options.has_key? :grid_size

        options = options.nil? ? defaults : defaults.merge!(options)
        position = options.delete(:position) || [Common::Screen.half_width, Common::Screen.half_height]
        CCTwirl.actionWithPosition(position,
                                   twirls: options[:twirls],
                                   amplitude: options[:amplitude],
                                   grid: options[:grid_size],
                                   duration: options[:duration])
      end

    end

  end
end