# Joybox - REPL Support Example
# Art By:Daniel Cook - Lost Garden http://www.lostgarden.com/2007/05/dancs-miraculously-flexible-game.html
# Authors: Joybox Swarm
# Joybox REPL Support Example
# Includes:
# => Scene & Sprites
# => REPL Support

class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow

    director.run_with_scene(GameScene.new)
  end

  def buildWindow
    main_window.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    main_window.contentView.addSubview(director.view)
    main_window.orderFrontRegardless
    main_window.center
  end

  def director
    @director ||= Joybox::Configuration.setup do
      director display_stats: true
      debug repl:true
    end
  end

  def main_window_size
    [1024, 768]
  end

  def main_window
    @main_window ||= NSWindow.alloc.initWithContentRect([[0, 0], main_window_size ],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
  end
end
