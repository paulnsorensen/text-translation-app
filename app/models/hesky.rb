class Hesky
  
  attr_accessor :text
  
  def heskyize
    self.text = self.text.downcase.gsub('you', 'u')
    self.text.gsub!('(', "(  ")
    self.text.gsub!(')', "  )")
    self.text.gsub!('physical', "phyzical")
    self.text.gsub!('especially', "esp")
    self.text.gsub!('schedule', "scheduale")
    self.text.gsub!('we would', "would")
    self.text.gsub!('i would', "would")
    self.text.gsub!('we want', "want")
    self.text.gsub!('i want', "want")  
    self.text.gsub!('you\'re', "ur")
    self.text.gsub!('.') {rand > 0.6 ? "-" : "." }
    self.text.gsub!(' ') {rand > 0.8 ? "  " : " " }
    self.text = self.text.insert(text.length, " :)")
    return self.text
  end
  
end