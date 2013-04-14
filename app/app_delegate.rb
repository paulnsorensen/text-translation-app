class AppDelegate < ProMotion::AppDelegateParent
  
  def on_load(app, options)
    open TextScreen.new(nav_bar: true)
  end
  
end
