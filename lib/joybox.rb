unless defined?(Motion::Project::Config)
  raise "The joybox gem must be required within a RubyMotion project Rakefile."
end

require File.expand_path('../../support/support.rb', __FILE__)

Motion::Project::App.setup do |app|

  app.frameworks += ["QuartzCore", 
                     "CoreGraphics", 
                     "Foundation", 
                     "ApplicationServices",
                     "OpenAL",
                     "AVFoundation",
                     "AudioToolbox",
                     "QuartzCore"]

  app.libs << "/usr/lib/libz.dylib"

  # Scans app.files until it finds app/ (the default)
  # if found, it inserts just before those files, otherwise it will insert to
  # the end of the list
  insert_point = 0
  app.files.each_index do |index|
    file = app.files[index]
    if file =~ /^(?:\.\/)?app\//
      # found app/, so stop looking
      break
    end
    insert_point = index + 1
  end

  cocos2d_vendor = File.expand_path(File.join(File.dirname(__FILE__), '../vendor/Cocos2D'))
  box2d_vendor = File.expand_path(File.join(File.dirname(__FILE__), '../vendor/Box2D.framework'))

  app.vendor_project(cocos2d_vendor,
                     :static,
                     :products => ["libcocos2d.a", "libCocosDenshion.a"],
                     :headers_dir => "include")

  app.vendor_project(box2d_vendor,
                     :static,
                     :products => ['Box2D'],
                     :headers_dir => "Headers")

  Dir.glob(File.join(File.dirname(__FILE__), 'joybox/**/*.rb')).reverse.each do |file|
    app.files.insert(insert_point, file)
  end
end