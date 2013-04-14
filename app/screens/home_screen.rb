class HomeScreen < ProMotion::GroupedTableScreen
  title "Heskyize?"
  
  def on_load
  end
  
  def table_data
    [
      {
        cells: [{title: "Add a Hesky", action: :open_text_screen, accessory_type: UITableViewCellAccessoryDisclosureIndicator}]
        }, {
        title: "Saved Heskies",
        cells: [{title: "hellos :)"}]  
      }
    ]
  end
  
  def open_text_screen
    open TextScreen.new(nav_bar: true)
  end
  
end