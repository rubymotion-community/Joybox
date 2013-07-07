module Joybox

  include Joybox::Common
  include Joybox::Core
  include Joybox::Actions
  include Joybox::Animations
  include Joybox::UI
  include Joybox::Macros
  include Joybox::Physics
  include Joybox::Audio

  attr_accessor :random

  module_function

  def director
    Director.sharedDirector
  end

  def generate_seed
    @random ||= Random.new
    @random.rand(10...100)
  end

end