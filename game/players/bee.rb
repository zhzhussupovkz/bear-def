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
    @img = Gosu::Image.new(window, "images/bee.png", false)
    @drawing, @green, @red = true, Gosu::Color.argb(0xff00ff00), Gosu::Color.argb(0xffff0000)
    @stamina = 100
  end

  attr_accessor :x, :y
  attr_reader :window, :green, :red, :stamina
  
  #draw
  def draw
    if @drawing
      @img.draw(x, y, 1)
      window.draw_line(x + 4, y - 5, green, x + 4 + stamina/4, y - 5, green, 1, mode = :default)
      window.draw_line(x + 4 + stamina/4, y - 5, red, x + 29, y - 5, red, 1, mode = :default)
    end
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
    @img = Gosu::Image.new(window, "images/bee.png", false)
  end

  #move right
  def move_right
    @x += 1.0
  end

end