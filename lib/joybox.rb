unless defined?(Motion::Project::Config)
  raise "The joybox gem must be required within a RubyMotion project Rakefile."
end

require File.expand_path('../../support/support.rb', __FILE__)

# Extracted from Teacup: https://github.com/rubymotion/teacup
# Thanks Colin! (@colinta)
platform = Motion::Project::App.respond_to?(:template) ? Motion::Project::App.template : :ios
platform_setup = File.join(File.dirname(__FILE__), "joybox/joybox-#{platform}.rb") 

unless File.exists? platform_setup
  raise "Sorry, the platform #{platform.inspect} is not supported by joybox"
end

require platform_setup


Motion::Project::App.setup do |app|

  joybox = File.expand_path(File.join(File.dirname(__FILE__), '../motion/joybox'))

  # Scans app.files until it finds app/ (the default)
  # if found, it inserts just before those files, otherwise it will insert to
  # the end of the list
  insert_point = app.files.find_index { |file| file =~ /^(?:\.\/)?app\// } || 0

  Dir.glob(File.join(joybox, '**/*.rb')).reverse.each do |file|
    app.files.insert(insert_point, file)
  end
end