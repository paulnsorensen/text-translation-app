class SettingsViewController < UIViewController
  def viewDidLoad
    super
    self.title = "Settings"
    # UITableStyleGrouped sets this to a grouped table 
    table_view = UITableView.alloc.initWithFrame(view.bounds, style: UITableViewStyleGrouped)
    view << table_view

  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin 
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuseIdentifier)
    end
    # data goes here
  end
  
  def tableView(tableView, numberOfRowsInSection: section)
    return 5
  end

  def viewDidUnload
    super
    # Release any retained subviews of the main view.
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
end
