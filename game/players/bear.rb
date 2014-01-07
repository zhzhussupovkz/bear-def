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
    @drawing, @stamina, @score = true, 100, 0
    @weapon = Weapon.new window
  end

  attr_reader :window

  #draw
  def draw
    if @drawing
      @img.draw 30, 209, 1
      @weapon.draw
    end
  end

  #shooting
  def shooting
    @weapon.shot if window.button_down? Gosu::MsLeft
  end

  #add score
  def add_score
    @score += 100
  end

  #update
  def update
    shooting
  end

end