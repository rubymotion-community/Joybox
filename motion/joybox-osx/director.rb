module Joybox
  class Director < CCDirectorDisplayLink

    alias_method :run_with_scene, :runWithScene
    alias_method :push_scene, :pushScene
    alias_method :pop_scene, :popScene
    alias_method :pop_to_root_scene, :popToRootScene
    alias_method :replace_scene, :replaceScene
    alias_method :stop_animation, :stopAnimation
    alias_method :start_animation, :startAnimation
    alias_method :purge_cached_data, :purgeCachedData
    alias_method :set_next_delta_time_zero, :setNextDeltaTimeZero
    alias_method :set_full_screen, :setFullScreen
    alias_method :is_full_screen, :isFullScreen

    def self.default_configuration
      {
        display_stats: false,
        animation_interval: 1.0/60,
        resize_mode: KCCDirectorResize_AutoScale,
        delegate: nil
      }
    end

    def self.configure(options = {})
      options = options.nil? ? default_configuration : default_configuration.merge!(options)

      director = Director.sharedDirector
      director.displayStats = options[:display_stats]
      director.animationInterval = options[:animation_interval]
      director.resizeMode = options[:resize_mode]
      director.delegate = options[:delegate]
    end


    def << (scene)
      self.push_scene(scene)
    end

  end
end