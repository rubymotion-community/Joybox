class AppDelegate
 
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    Joybox::Cocos2D.setup 

    
    @director = Joybox::Cocos2D::Director.sharedDirector

    @navigation_controller = UINavigationController.alloc.initWithRootViewController(@director)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.setRootViewController(@navigation_controller)
    @window.makeKeyAndVisible
    true
  end
end
