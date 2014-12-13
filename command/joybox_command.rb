module Joybox
  module Command
    class Base < Motion::Command
      self.abstract_command = true
      self.command = 'joybox'
      self.summary = 'Joybox specific commands.'
    end
  end
end

require 'joybox_generate_command'
require 'joybox_retina_command'
