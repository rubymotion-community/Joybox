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
    end


    def director(*hash)

      hash = hash.pop

      Director.configure(hash)

      @is_director_configured = true
    end


    def opengl_view(*hash)

      hash = hash.pop

      opengl_view = GLView.new(hash)

      director = Director.sharedDirector

      director.view = opengl_view

      @is_opengl_view_configured = true
    end

  end
end
