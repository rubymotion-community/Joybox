module Joybox
  module Audio

    class BackgroundAudio

      attr_reader :audios

      def initialize
        @audios = Hash.new
      end

      def [](audio)
        @audios[audio]
      end

      def []=(audio, file_name)
        add audio: audio, file_name: file_name
      end

      def audios
        @audios.keys
      end

      def add(options = {})
        # Todo print error message on the console
        return unless [:audio, :file_name].all? { |k| options.has_key? k }

        @audios[options[:audio]] = options[:file_name]
        SimpleAudioEngine.sharedEngine.preloadBackgroundMusic(options[:file_name])
      end

      def play(audio, options = {})
        stop if playing?
        
        if [:loop].all? { |k| options.has_key? k }
          SimpleAudioEngine.sharedEngine.playBackgroundMusic(@audios[audio], loop: options[:loop])
        else
          SimpleAudioEngine.sharedEngine.playBackgroundMusic(@audios[audio])
        end
      end

      def stop
        SimpleAudioEngine.sharedEngine.stopBackgroundMusic
      end

      def volume
        SimpleAudioEngine.sharedEngine.backgroundMusicVolume
      end

      def volume=(volume)
        SimpleAudioEngine.sharedEngine.setBackgroundMusicVolume(volume)
      end

      def pause
        SimpleAudioEngine.sharedEngine.pauseBackgroundMusic
      end

      def resume
        SimpleAudioEngine.sharedEngine.resumeBackgroundMusic
      end

      def rewind
        SimpleAudioEngine.sharedEngine.rewindBackgroundMusic
      end

      def playing?
        SimpleAudioEngine.sharedEngine.isBackgroundMusicPlaying
      end

      def will_play?
        SimpleAudioEngine.sharedEngine.willPlayBackgroundMusic
      end

    end

  end
end