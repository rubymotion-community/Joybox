module Joybox

  include Joybox::Common
  include Joybox::Core
  include Joybox::Actions
  include Joybox::Animations
  include Joybox::UI
  include Joybox::Macros
  include Joybox::Physics
  
  module_function

  def director
    Director.sharedDirector
  end

end