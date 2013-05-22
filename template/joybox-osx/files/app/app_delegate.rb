class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow

    director.run_with_scene(DefaultLayer.scene)
  end

  def buildWindow
    main_window.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    main_window.contentView.addSubview(director.view)
    main_window.orderFrontRegardless
    main_window.center
  end

  def main_window_size
    [800, 600]
  end

  def director
    @director ||= Joybox::Configuration.setup do
      director display_stats: true
    end
  end

  def main_window
    @main_window ||= NSWindow.alloc.initWithContentRect([[0, 0], main_window_size],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
  end
end
