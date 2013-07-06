module Joybox
  module Audio

    class AudioEffects

      attr_reader :effects

      def initialize
        @effects = Hash.new
      end

      def [](event)
        @effects[event]
      end

      def []=(event, file_name)
        add event: event, file_name: file_name
      end

      def events
        @effects.keys
      end

      def add(options = {})
        # Todo print error message on the console
        return unless [:event, :file_name].all? { |k| options.key? k }

        @effects[options[:event]] = options[:file_name]
        SimpleAudioEngine.sharedEngine.preloadEffect(options[:file_name])
      end

      def play(event, options = {})
        if [:pitch, :pan, :gain].all? { |k| options.key? k }
          return SimpleAudioEngine.sharedEngine.playEffect(@effects[event],
                                                           pitch: options[:pitch],
                                                           pan: options[:pan],
                                                           gain: options[:gain])
        else
          return SimpleAudioEngine.sharedEngine.playEffect(@effects[event])
        end
      end

      def stop(audio_id)
        SimpleAudioEngine.sharedEngine.stopEffect(audio_id) 
      end

      def delete(event)
        SimpleAudioEngine.sharedEngine.unloadEffect(@effects[event])
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
