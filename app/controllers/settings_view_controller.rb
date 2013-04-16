class SettingsViewController < UIViewController
  def viewDidLoad
    super
    self.title = "Settings"
    self.tabBarItem.setFinishedSelectedImage("settings_icon".uiimage, withFinishedUnselectedImage:"settings_icon".uiimage)
    # UITableStyleGrouped sets this to a grouped table 
    table_view = UITableView.alloc.initWithFrame(view.bounds, style: UITableViewStyleGrouped)
    # Key part of the table it seems 
    table_view.dataSource = self 
    view << table_view
    
    @data_settings = ["Capitalization", "Parantheses Spaces", "Remove Pronouns", "Phyzicals", "Especially", "Happy Faces"]

  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin 
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuseIdentifier)
    end
    cell.textLabel.text = @data_settings[indexPath.row]
    @switch = UISwitch.alloc.init
    @switch.addTarget(self, action: '#{@data_settings[indexPath.row]}Toggle', forControlEvents:UIControlEventValueChanged)
    @switch.setOn(true, animated:true)
    cell.accessoryView = @switch
    
    cell
  end
  
  def tableView(tableView, numberOfRowsInSection: section)
    return @data_settings.count
  end
  
  def tableView(tableView, numberOfSectionsInTableView: tableView)
    return 1
  end

  def viewDidUnload
    super
    # Release any retained subviews of the main view.
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
end
