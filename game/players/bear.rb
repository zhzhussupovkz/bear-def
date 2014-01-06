=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Bear
class Bear

  def initialize window
    @window = window
    @img = Gosu::Image.new(window, "images/bear.png", false)
    @drawing = true
    @stamina = 100
  end

  attr_reader :window
  
  #draw
  def draw
    @img.draw 30, 209, 1 if @drawing
  end

end