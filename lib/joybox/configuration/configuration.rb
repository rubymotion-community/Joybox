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
      texture_2d unless @is_texture_2d_configured
      file_utils unless @is_file_utils_configured
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


    def texture_2d(*hash)

      hash = hash.pop

      Texture2D.configure(hash)

      @is_texture_2d_configured = true
    end


    def file_utils(*hash)

      hash = hash.pop

      FileUtils.configure(hash)

      @is_file_utils_configured = true
    end

  end
end
