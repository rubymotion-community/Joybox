class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    Joybox::Configuration.setup do

      director display_stats: true
    end

    @director = Joybox.director

    @navigation_controller = UINavigationController.alloc.initWithRootViewController(@director)
    @navigation_controller.navigationBarHidden = true

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.setRootViewController(@navigation_controller)
    @window.makeKeyAndVisible

    @director.push_scene(MenuLayer.scene)

    true
  end
end
