Motion::Project::App.setup do |app|

  # Extracted from Teacup: https://github.com/rubymotion/teacup
  # Thanks Colin! (@colinta)
  platform = app.respond_to?(:template) ? app.template : :ios
  
  platform_joybox = File.expand_path(File.join(File.dirname(__FILE__), "../../motion/joybox-#{platform}"))
  platform_vendor = File.expand_path(File.join(File.dirname(__FILE__), "../../vendor/vendor-#{platform}"))


  app.frameworks += ["QuartzCore", 
                     "CoreGraphics", 
                     "Foundation", 
                     "ApplicationServices", 
                     "OpenAL", 
                     "AVFoundation", 
                     "AudioToolbox", 
                     "QuartzCore"]

  app.libs << "/usr/lib/libz.dylib"
  

  cocos2d_vendor = File.expand_path(File.join(platform_vendor, "cocos_2d"))
  box2d_vendor = File.expand_path(File.join(platform_vendor, "Box2D.framework"))

  app.vendor_project(cocos2d_vendor,
                     :static,
                     :products => ["libcocos2d.a"],
                     :headers_dir => "include",
                     :bridgesupport_cflags => "-D__CC_PLATFORM_IOS -ISupport -IPlatforms -IPlatforms/iOS",
                     :bridgesupport_exceptions => ["cocos_2d_exceptions.bridgesupport"])

  app.vendor_project(box2d_vendor,
                     :static,
                     :products => ['Box2D'],
                     :headers_dir => "Headers")


  # Scans app.files until it finds app/ (the default)
  # if found, it inserts just before those files, otherwise it will insert to
  # the end of the list
  insert_point = app.files.find_index { |file| file =~ /^(?:\.\/)?app\// } || 0

  Dir.glob(File.join(platform_joybox, '**/*.rb')).reverse.each do |file|
    app.files.insert(insert_point, file)
  end
end