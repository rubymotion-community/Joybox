class AppDelegate
 
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    Joybox::Cocos2D::Configuration.setup do 

      director display_stats: true
      
    end


    @director = Joybox::Cocos2D.director

    @navigation_controller = UINavigationController.alloc.initWithRootViewController(@director)
    @navigation_controller.navigationBarHidden = true

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.setRootViewController(@navigation_controller)
    @window.makeKeyAndVisible

    true
  end
end
