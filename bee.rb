=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Bee
class Bee

  def initialize window, x, y
    @window, @x, @y = window, x, y
    bees = ["bee.png", "bee-l.png"].sample
    @img = Gosu::Image.new(window, "images/" + bees, false)
  end

  attr_reader :x, :y
  
  #draw
  def draw
    @img.draw(x, y, 1)
  end

  #update
  def update
    
  end

  #move left
  def move_left
    @x -= 2.0
  end

  #move right
  def move_right
    @x += 2.0
  end

end