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

    def enable
      SimpleAudioEngine.sharedEngine.setEnabled(true)
    end

    def disable
      SimpleAudioEngine.sharedEngine.setEnabled(false)
    end

    def enabled?
      SimpleAudioEngine.sharedEngine.enabled
    end

  end
end