class EndtextViewController < UIViewController
  attr_accessor :endtext
  attr_accessor :hesky
  
  def viewDidLoad
    super
    view.backgroundColor = "subtle_white_feathers.png".uicolor
    
    # Code for the dismiss view controller if modal is activated. Remove for normal master-detail functionality 
    # self.navigationItem.leftBarButtonItem = UIBarButtonItem.done {self.dismissViewControllerAnimated true, completion: nil}
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.titled("Share") {share}
    self.title = "Heskyized!"
    
    header_frame = CGRect.make(x: 13, y:25, width: 300, height: 200)
    header_label = UITextView.alloc.initWithFrame header_frame
    header_label.text = endtext
    header_label.editable = false 
    header_label.textColor = 0xa45252.uicolor
    header_label.font = :bold.uifont(18)
    header_label.backgroundColor = :clear.uicolor
    view << header_label 
    
    image_frame = view.bounds.down(-5).width(view.bounds.width).height(view.bounds.height)
    hesky_image = UIImageView.alloc.initWithFrame image_frame
    hesky_image.image = "snob_email.png".uiimage
    view << hesky_image
      
  end
  
  def initWithText(hesky)
    initWithNibName(nil, bundle:nil)
    self.endtext = hesky.heskyize
    self
  end

  def viewDidUnload
    super
    # Release any retained subviews of the main view.
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
  
  def share
    # implements the sharing page that lets you email stuff
    activityItems = [endtext]
    shareController = UIActivityViewController.alloc.initWithActivityItems(activityItems, applicationActivities: nil)
    self.presentViewController(shareController, animated: true, completion: nil)
    
  end
  
end
