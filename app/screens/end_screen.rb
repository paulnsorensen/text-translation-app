class EndScreen < ProMotion::Screen
  title "Heskyized!"
  attr_accessor :endtext
  
  def on_load
    set_nav_bar_left_button "Close", action: :close_screen
    set_nav_bar_right_button "Share", action: :share
    self.endtext 
    
    view.backgroundColor = "subtle_white_feathers.png".uicolor
    header_frame = view.bounds.down(30).width(view.bounds.width).height(view.bounds.height)
    header_label = UITextView.alloc.initWithFrame header_frame
    header_label.text = translate(endtext)
    header_label.textColor = 0x428342.uicolor
    header_label.font = :bold.uifont(20)
    header_label.backgroundColor = :clear.uicolor
    view << header_label 
  end
  
  def translate(text)
    text = text.downcase.gsub('you', 'u')
       text.gsub!('(', "(  ")
       text.gsub!(')', "  )")
       text.gsub!('physical', "phyzical")
       text.gsub!('especially', "esp")
       text.gsub!('schedule', "scheduale")
       text.gsub!('we would', "would")
       text.gsub!('i would', "would")
       text.gsub!('we want', "want")
       text.gsub!('i want', "want")  
       text.gsub!('you\'re', "ur")
       text.gsub!('.') {rand > 0.6 ? "-" : "." }
       text.gsub!(' ') {rand > 0.8 ? "  " : " " }
       text = text.insert(text.length, " :)")
       return text
  end
  
  def close_screen
    close
  end
  
  def share
    if defined?(SLComposeViewController)
  end
  
end