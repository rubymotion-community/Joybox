unless defined?(Motion::Project::Config)
  raise "The joybox gem must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|

  app.vendor_project("vendor/cocos2d-iphone", 
                     :xcode,
                     :xcodeproj => "cocos2d-ios.xcodeproj", 
                     :target => "cocos2d", 
                     :products => ["libcocos2d.a"],
                     :headers_dir => "cocos2d")

  app.vendor_project("vendor/cocos2d-iphone/CocosDenshion/CocosDenshion", 
                     :static)

  app.frameworks += ["OpenGLES", "OpenAL", "AVFoundation", "AudioToolbox", "QuartzCore"]
  app.libs << "/usr/lib/libz.dylib"

  # scans app.files until it finds app/ (the default)
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

  Dir.glob(File.join(File.dirname(__FILE__), 'cocos_2d/**/*.rb')).reverse.each do |file|
    app.files.insert(insert_point, file)
  end
end