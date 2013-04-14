class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    hesky = HeskyizeViewController.alloc.init
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(hesky)

    true
  end
end
