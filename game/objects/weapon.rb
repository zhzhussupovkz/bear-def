=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Weapon
class Weapon

  def initialize window
    begin
      @window = window
      @img = Gosu::Image.new window, "images/weapons/pistol.png", true
      @x, @y, @angle = 57.5, 225, 0
      @sound = Gosu::Song.new window, 'sounds/gun.ogg'
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window, :x, :y

  #draw
  def draw
    @img.draw_rot x, y, 2, angle
  end

  #calculate angle
  def angle
    @angle = Gosu::angle(window.mouse_x, window.mouse_y, x, y) + 90
  end

  #shot
  def shot
    @sound.play(looping = false)
  end

end