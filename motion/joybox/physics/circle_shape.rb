class CircleShape < B2DCircleShape

  extend Joybox::Common::Initialize

  def initialize(options = {})
    initWithRadius(options[:radius].to_pixels)
  end

end