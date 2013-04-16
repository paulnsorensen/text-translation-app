include SugarCube::Modal

class HeskyizeViewController < UIViewController
  attr_accessor :inputtext
  
  def viewDidLoad
    super
    # Do any additional setup after loading the view.
    view.backgroundColor = "green-fibers.png".uicolor
    self.title = "Heskyize?"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.titled('Translate') {openTranslate}
    
    # Set up a scrollable view so that the keyboard does not block the view 
    scroll_frame = view.bounds
    scroll_view = UIScrollView.alloc.initWithFrame scroll_frame
    scroll_view.contentSize = CGSizeMake(scroll_frame.width, scroll_frame.height*1.3)
    scroll_view.scrollEnabled = true
    view << scroll_view

    # Set up the view and label for the instruction sheet 
    header_frame = view.bounds.down(10).width(view.bounds.width).height(70)
    header_label = UITextView.alloc.initWithFrame header_frame
    header_label.text = "In the text box below, what text do you want to translate?"
    header_label.editable = false
    header_label.font = :bold.uifont(20)
    header_label.textColor = UIColor.whiteColor
    header_label.backgroundColor = :clear.uicolor
    header_label.on_tap {backgroundTouched}
    scroll_view << header_label 
    
    # Add a subview so that you can overlay the text input field
    edit_frame = header_frame.below(0).width(view.bounds.width).height(scroll_view.bounds.height)
    subview = UIView.alloc.initWithFrame edit_frame
    scroll_view << subview
    
    # Add the text input field as a UITextView within an anonymous frame
    @edit_label = UITextView.alloc.initWithFrame(edit_frame.below(5).width(300).centered_in(edit_frame))
    @edit_label.editable = true
    @edit_label.backgroundColor = "subtle_white_feathers.png".uicolor
    @edit_label.font = :bold.uifont(16)
    @edit_label.scrollEnabled = true
    
    subview << @edit_label

    
  end

  def viewDidUnload
    super
    # Release any retained subviews of the main view.
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
  
  # The button method used to pass the input text and make a new screen
  def openTranslate
    @hesky = Hesky.new
    @hesky.text = @edit_label.text
    
    # Instantiate a version of the new view controller with self create init method
    final = EndtextViewController.alloc.initWithText(@hesky)
    self.navigationController.pushViewController(final, animated: true)
    
    # present_modal(UINavigationController.alloc.initWithRootViewController(final))
    # You'll need to create another UINavigationController, push your modal_controller into it, and present that
  end
  
  # The method that is called in order to drop off the keyboard from the screen
  def backgroundTouched
    @edit_label.resignFirstResponder
  end
  
end
