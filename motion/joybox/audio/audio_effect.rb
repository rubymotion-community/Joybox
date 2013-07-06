module Joybox
  module Audio

    class AudioEffect

      attr_reader :effects

      def initialize
        @effects = Hash.new
      end

      def [](effect)
        @effects[effect]
      end

      def []=(effect, file_name)
        add effect: effect, file_name: file_name
      end

      def events
        @effects.keys
      end

      def add(options = {})
        # Todo print error message on the console
        return unless [:effect, :file_name].all? { |k| options.key? k }

        @effects[options[:effect]] = options[:file_name]
        SimpleAudioEngine.sharedEngine.preloadEffect(options[:file_name])
      end

      def play(effect, options = {})
        if [:pitch, :pan, :gain].all? { |k| options.key? k }
          return SimpleAudioEngine.sharedEngine.playEffect(@effects[effect],
                                                           pitch: options[:pitch],
                                                           pan: options[:pan],
                                                           gain: options[:gain])
        else
          return SimpleAudioEngine.sharedEngine.playEffect(@effects[effect])
        end
      end

      def stop(audio_id)
        SimpleAudioEngine.sharedEngine.stopEffect(audio_id) 
      end

      def delete(effect)
        SimpleAudioEngine.sharedEngine.unloadEffect(@effects[effect])
      end

      def volume
        SimpleAudioEngine.sharedEngine.effectsVolume
      end

      def volume=(volume)
        SimpleAudioEngine.sharedEngine.setEffectsVolume(volume)
      end

    end

  end
end