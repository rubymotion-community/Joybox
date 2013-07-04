Motion::Project::App.setup do |app|

  # Extracted from Teacup: https://github.com/rubymotion/teacup
  # Thanks Colin! (@colinta)
  platform = app.respond_to?(:template) ? app.template : :ios
  
  platform_joybox = File.expand_path(File.join(File.dirname(__FILE__), "../../motion/joybox-#{platform}"))
  platform_vendor = File.expand_path(File.join(File.dirname(__FILE__), "../../vendor/vendor-#{platform}"))


  app.frameworks += ["QuartzCore", 
                     "CoreGraphics", 
                     "Foundation", 
                     "OpenGLES",
                     "OpenAL", 
                     "AVFoundation", 
                     "AudioToolbox", 
                     "QuartzCore"]

  app.libs << "/usr/lib/libz.dylib"
  

  cocos2d_vendor = File.expand_path(File.join(platform_vendor, "cocos_2d"))
  cocos_denshion_vendor = File.expand_path(File.join(platform_vendor, "cocos_denshion"))
  cocos_builder_reader_vendor = File.expand_path(File.join(platform_vendor, "cocos_builder_reader"))
  box2d_vendor = File.expand_path(File.join(platform_vendor, "box_2d"))
  kazmath_vendor = File.expand_path(File.join(platform_vendor, "kazmath"))

  app.vendor_project(cocos2d_vendor,
                     :static,
                     :products => ["libcocos2d.a"],
                     :bridgesupport_cflags => "-D__CC_PLATFORM_IOS -ISupport -IPlatforms -IPlatforms/iOS",
                     :bridgesupport_exceptions => ["cocos_2d_exceptions.bridgesupport"])

  app.vendor_project(cocos_denshion_vendor,
                     :static,
                     :products => ['libCocosDenshion.a'],
                     :bridgesupport_cflags => "-DNDEBUG")

  app.vendor_project(cocos_builder_reader_vendor,
                     :static,
                     :products => ['libCocosBuilderReader.a'],
                     :bridgesupport_cflags => "-DNDEBUG -I../../cocos_2d/cocos_2d_include/.")

  app.vendor_project(box2d_vendor,
                     :static,
                     :products => ['libBox2D.a'])

  app.vendor_project(kazmath_vendor,
                     :static,
                     :products => ['libkazmath.a'])

  # Scans app.files until it finds app/ (the default)
  # if found, it inserts just before those files, otherwise it will insert to
  # the end of the list
  insert_point = app.files.find_index { |file| file =~ /^(?:\.\/)?app\// } || 0

  Dir.glob(File.join(platform_joybox, '**/*.rb')).reverse.each do |file|
    app.files.insert(insert_point, file)
  end
end
