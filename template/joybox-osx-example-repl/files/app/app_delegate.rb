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
  end

  def buildWindow
    @director = Joybox::Configuration.setup do
      director display_stats: true
      debug repl:true
    end

    @main_window = NSWindow.alloc.initWithContentRect([[240, 180], [1024, 768]],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)

    @main_window.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @main_window.contentView.addSubview(@director.view)
    @main_window.orderFrontRegardless

    @director.run_with_scene(GameScene.new)
  end
end
