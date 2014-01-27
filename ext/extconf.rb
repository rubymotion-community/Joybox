# TODO this file is no longer needed to register the commands and templates.
#      See the lib/motion_plugin.rb file instead.
#      This file can be removed in the future, when it can be assumed that all
#      the user installations have had their ~/Library/RubyMotion dir cleaned
#      up.

require 'fileutils'

ruby_motion_directory = File.expand_path('~/Library/RubyMotion')
template_directory = File.join(ruby_motion_directory, 'template')

# Previous version clean up
FileUtils.rm_rf File.join(command_directory, 'joybox')
FileUtils.rm_f File.join(command_directory, 'joybox_generate_command.rb')
FileUtils.rm_rf File.join(template_directory, 'joybox-ios')
FileUtils.rm_rf File.join(template_directory, 'joybox-ios-example-repl')
FileUtils.rm_rf File.join(template_directory, 'joybox-osx')
FileUtils.rm_rf File.join(template_directory, 'joybox-osx-example-repl')

require 'mkmf'
create_makefile('')
