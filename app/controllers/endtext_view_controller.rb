class EndtextViewController < UIViewController
  attr_accessor :endtext
  
  def viewDidLoad
    super
    view.backgroundColor = 0xa66110.uicolor
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.done {self.dismissViewControllerAnimated true, completion: nil}
    self.title = "Heskyized!"
    
    header_frame = view.bounds.down(30).width(view.bounds.width).height(view.bounds.height)
    header_label = UITextView.alloc.initWithFrame header_frame
    header_label.text = endtext
    header_label.textColor = UIColor.whiteColor
    header_label.font = :bold.uifont(20)
    header_label.backgroundColor = :clear.uicolor
    view << header_label 
      
  end
  
  def initWithText(inputtext)
    initWithNibName(nil, bundle:nil)
    self.endtext = heskyize(inputtext)
    self
  end

  def viewDidUnload
    super
    # Release any retained subviews of the main view.
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
  
  def heskyize(text)
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
  
end
