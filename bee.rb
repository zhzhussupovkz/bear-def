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
    @drawing = true
  end

  attr_accessor :x, :y
  attr_reader :window
  
  #draw
  def draw
    @img.draw(x, y, 1) if @drawing
  end

  #update
  def update
    move_left
  end

  #move left
  def move_left
    @x -= 1.0
    reboot if @x <= 0
  end

  #reboot
  def reboot
    @x = 720
    @y = rand(50..400)
    bees = ["bee.png", "bee-l.png"].sample
    @img = Gosu::Image.new(window, "images/" + bees, false)
  end

  #move right
  def move_right
    @x += 1.0
  end

end