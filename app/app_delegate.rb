class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    trans_controller = UINavigationController.alloc.initWithRootViewController(HeskyizeViewController.alloc.init)
    settings = UINavigationController.alloc.initWithRootViewController(SettingsViewController.alloc.init)
    
    # Code for the customization of the tab bar 
    UINavigationBar.appearance.tintColor = 0x666053.uicolor
    
    tab_controller = UITabBarController.alloc.init
    
    # Note that the tab bar image has to be 320 x 49 pixels. 
    # See more here: http://felipecypriano.com/2012/02/27/how-to-customize-uitabbar-on-ios-5/
    tab_controller.tabBar.BackgroundImage = "TabBarBackground.png".uiimage
    
    # Sets the tabs inside the app 
    tab_controller.viewControllers = [trans_controller, settings]
    @window.rootViewController = tab_controller
    
    true
  end
end
