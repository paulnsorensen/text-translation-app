class TextScreen < ProMotion::Screen
  attr_accessor :text
  
  def on_load
    view.backgroundColor = "subtle_white_feathers.png".uicolor # 0x00BF32.uicolor
    set_nav_bar_right_button "Translate", action: :open_translate_screen
    frame = view.bounds.down(30).width(view.bounds.width).height(view.bounds.height)
    @label = UITextView.alloc.initWithFrame frame
    @label.textColor = 0xa45252.uicolor
    @label.font = :bold.uifont(20)
    @label.backgroundColor = :clear.uicolor
    view << @label
  end
  
  def open_translate_screen
    text = @label.text
    open EndScreen.new(nav_bar: true, endtext: text), modal: true
  end
  
end