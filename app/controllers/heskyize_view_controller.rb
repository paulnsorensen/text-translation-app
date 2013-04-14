include SugarCube::Modal

class HeskyizeViewController < UIViewController
  attr_accessor :inputtext
  
  def viewDidLoad
    super
    # Do any additional setup after loading the view.
    view.backgroundColor = "green-fibers.png".uicolor
    self.title = "Heskyize?"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.titled('Translate') {openTranslate}
    # You'll need to create another UINavigationController, push your modal_controller into it, and present that
    
    header_frame = view.bounds.down(10).width(view.bounds.width).height(60)
    header_label = UITextView.alloc.initWithFrame header_frame
    header_label.text = "In the text box below, what text do you want to translate?"
    header_label.editable = false
    header_label.font = :bold.uifont(20)
    header_label.textColor = UIColor.whiteColor
    header_label.backgroundColor = :clear.uicolor
    view << header_label 
    
    edit_frame = header_frame.below(10).width(view.bounds.width).height(view.bounds.height)
    @edit_label = UITextView.alloc.initWithFrame edit_frame
    @edit_label.editable = true
    @edit_label.backgroundColor = "subtle_white_feathers.png".uicolor
    @edit_label.font = :bold.uifont(16)
    # edit_label.on :editing_did_end do
    #   @inputtext = edit_label.text
    # end
    # edit_label.off :end
    view << @edit_label

    
  end

  def viewDidUnload
    super
    # Release any retained subviews of the main view.
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
  
  def openTranslate
    @inputtext = @edit_label.text
    present_modal(
      UINavigationController.alloc.initWithRootViewController(
      EndtextViewController.alloc.initWithText(@inputtext)))
  end
  
end
