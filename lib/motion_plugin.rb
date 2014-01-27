# Load Joybox plugin commands.
require 'joybox_generate_command'
require 'joybox_retina_command'

# Register Joybox project templates.
require 'motion/project/template'
Dir.glob(File.expand_path('../../template/joybox-*', __FILE__)).each do |template_path|
  Motion::Project::Template.all_templates[File.basename(template_path)] = template_path
end
