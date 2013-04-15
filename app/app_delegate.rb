class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @director = Joybox::Configuration.setup do

      director display_stats: true
    end

    @navigation_controller = UINavigationController.alloc.initWithRootViewController(@director)
    @navigation_controller.navigationBarHidden = true

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.setRootViewController(@navigation_controller)
    @window.makeKeyAndVisible

    @director << MenuLayer.scene
    true
  end
end
