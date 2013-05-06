class AppDelegate

  def applicationDidFinishLaunching(notification)

    @director = Joybox::Configuration.setup

    @main_window = NSWindow.alloc.initWithContentRect([[240, 180], [480, 360]],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)

    @main_window.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @main_window.setCollectionBehavior(NSWindowCollectionBehaviorFullScreenPrimary)

    @main_window.contentView.addSubview(@director.view)

    @main_window.orderFrontRegardless

    @director.run_with_scene(Box2DLayer.scene)
  end

end