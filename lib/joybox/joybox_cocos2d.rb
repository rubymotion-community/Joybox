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

  app.files += Dir.glob(File.join(app.project_dir, 'cocos2d/**/*rb'))
end