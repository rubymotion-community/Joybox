module Joybox
  module Audio

    module_function

    def muted?
      SimpleAudioEngine.sharedEngine.mute
    end

    def mute
      SimpleAudioEngine.sharedEngine.mute = true
    end

    def unmute
      SimpleAudioEngine.sharedEngine.mute = false
    end

    def enabled?
      SimpleAudioEngine.sharedEngine.enabled
    end

    def enabled
      SimpleAudioEngine.sharedEngine.enabled
    end

    def enabled=(enabled)
      SimpleAudioEngine.sharedEngine.setEnabled(enabled)
    end

  end
end