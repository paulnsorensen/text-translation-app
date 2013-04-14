include SugarCube::Modal

class HeskyizeViewController < UIViewController
  attr_accessor :inputtext
  
  def viewDidLoad
    super
    # Do any additional setup after loading the view.
    view.backgroundColor = 0x00BF32.uicolor
    self.title = "Heskyize?"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.titled('Translate') {openTranslate}
    # You'll need to create another UINavigationController, push your modal_controller into it, and present that
    
    @inputtext = "Hi Jon, we would love to show you our new product, CareDox. Would you like to schedule a call to discuss further? We want to inject ourselves into doctor\'s offices (especially when they are giving physicals) to meet consumers at a time of need."
    
    header_frame = view.bounds.down(10).width(view.bounds.width).height(60)
    header_label = UITextView.alloc.initWithFrame header_frame
    header_label.text = "In the text box below, what text do you want to translate?"
    header_label.editable = false
    header_label.font = :bold.uifont(20)
    header_label.textColor = UIColor.whiteColor
    header_label.backgroundColor = :clear.uicolor
    view << header_label 
    
    edit_frame = header_frame.below(10).width(view.bounds.width).height(view.bounds.height)
    edit_label = UITextView.alloc.initWithFrame edit_frame
    edit_label.editable = true
    edit_label.text = @inputtext
    edit_label.backgroundColor = UIColor.whiteColor
    edit_label.font = :bold.uifont(16)
    edit_label.on :editing_did_end do
      @inputtext = edit_label.text
    end
    edit_label.off :end
    view << edit_label

    
  end

  def viewDidUnload
    super
    # Release any retained subviews of the main view.
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
  
  def openTranslate
    present_modal(
      UINavigationController.alloc.initWithRootViewController(
      EndtextViewController.alloc.initWithText(@inputtext)))
  end
  
end
