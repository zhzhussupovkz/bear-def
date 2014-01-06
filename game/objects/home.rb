=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Home
class Home

  def initialize window
    @window = window
    @img = Gosu::Image.new window, "images/prop.png", true
  end

  attr_reader :window

  def draw
    @img.draw 0, 240, 1
  end
  
end