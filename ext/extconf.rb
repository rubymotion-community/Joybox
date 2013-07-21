require 'fileutils'

ruby_motion_directory = File.expand_path('~/Library/RubyMotion')
command_directory = File.join(ruby_motion_directory, 'command')
template_directory = File.join(ruby_motion_directory, 'template')

joybox_command_directory = File.expand_path('../../command', __FILE__)
joybox_template_directory = File.expand_path('../../template/', __FILE__)

# Previous version clean up
FileUtils.rm_rf File.join(command_directory, 'joybox')
FileUtils.rm_f File.join(command_directory, 'joybox_generate_command.rb')
FileUtils.rm_rf File.join(template_directory, 'joybox-ios')
FileUtils.rm_rf File.join(template_directory, 'joybox-ios-example-repl')
FileUtils.rm_rf File.join(template_directory, 'joybox-osx')
FileUtils.rm_rf File.join(template_directory, 'joybox-osx-example-repl')

FileUtils.mkdir_p(command_directory) unless File.directory?(command_directory)
FileUtils.mkdir_p(template_directory) unless File.directory?(template_directory)

Dir.glob(File.join(joybox_command_directory, '*.rb')).each do |source_file|
  destination_file = File.join(command_directory, File.basename(source_file))
  FileUtils.rm_f destination_file
  FileUtils.ln_s source_file, destination_file
end

Dir.glob(File.join(joybox_template_directory, '**')).each do |source_directory|
  destination_directory = File.join(template_directory, File.basename(source_directory))
  FileUtils.rm_f destination_directory
  FileUtils.ln_s source_directory, destination_directory
end

require 'mkmf'
create_makefile('')