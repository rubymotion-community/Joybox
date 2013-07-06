module Joybox
  module Configuration

    module_function

    def setup(&block)
      instance_eval(&block) if block_given?
      configure

      Director.sharedDirector
    end

    def configure
      director unless @is_director_configured
      opengl_view unless @is_opengl_view_configured
      debug unless @is_debug_configured
    end

    def director(options = {})
      Director.configure(options)
      @is_director_configured = true
    end

    def opengl_view(options = {})
      opengl_view = GLView.new(options)
      director = Director.sharedDirector
      director.view = opengl_view
      @is_opengl_view_configured = true
    end

    def debug(options = {})
      Debug.configure(options)
      @is_debug_configured = true
    end

  end
end
