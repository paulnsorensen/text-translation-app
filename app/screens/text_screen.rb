class TextScreen < ProMotion::Screen
  attr_accessor :text
  
  def on_load
    view.backgroundColor = 0x00BF32.uicolor
    set_nav_bar_right_button "Translate", action: :open_translate_screen
    frame = view.bounds.down(30).width(view.bounds.width).height(view.bounds.height)
    @label = UITextField.alloc.initWithFrame frame
    @label.placeholder = "Placeholder text"
    @label.textColor = UIColor.whiteColor
    @label.font = :bold.uifont(20)
    @label.backgroundColor = :clear.uicolor
    view << @label
  end
  
  def open_translate_screen
    text = @label.text
    open EndScreen.new(nav_bar: true, endtext: text), modal: true
  end
  
end