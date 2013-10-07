# Adding small amounts of madness to joybox stuff
module Joybox
  module Actions
    class Wiggle
      def self.defaults
        {
          duration: 0.5,
          count: 5,
          angle: 180
        }
      end

      def self.with(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        #minimum 2
        count = options[:count] < 2 ? 2 : (options[:count])
        wiggle_set = []
        half_rotation = options[:angle] / 2
        per_rotate = options[:duration] / count

        # Get the wiggles
        # Half wiggle to start
        direction = -1
        wiggle_set << Rotate.by(angle: half_rotation * direction, duration: per_rotate)
        # Wiggle loop
        (2...count).each do |i|
          direction *= -1
          wiggle_set << Rotate.by(angle: options[:angle] * direction, duration: per_rotate)
        end
        # Half wiggle to end
        direction *= -1
        wiggle_set << Rotate.by(angle: half_rotation * direction, duration: per_rotate)
        Sequence.with actions: wiggle_set
      end
    end
  end
end