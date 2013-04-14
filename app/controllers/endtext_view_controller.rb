class EndtextViewController < UIViewController
  attr_accessor :endtext
  
  def viewDidLoad
    super
    view.backgroundColor = "subtle_white_feathers.png".uicolor
    self.navigationItem.leftBarButtonItem = UIBarButtonItem.done {self.dismissViewControllerAnimated true, completion: nil}
    self.title = "Heskyized!"
    
    header_frame = CGRect.make(x: 10, y:50, width: 300, height: 200)
    header_label = UITextView.alloc.initWithFrame header_frame
    header_label.text = endtext
    header_label.editable = false 
    header_label.textColor = 0xa45252.uicolor
    header_label.font = :bold.uifont(18)
    header_label.backgroundColor = :clear.uicolor
    view << header_label 
    
    image_frame = view.bounds.down(20).width(view.bounds.width).height(view.bounds.height)
    hesky_image = UIImageView.alloc.initWithFrame image_frame
    hesky_image.image = "heskytalk.png".uiimage
    view << hesky_image
      
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