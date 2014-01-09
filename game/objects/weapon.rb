=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Weapon
class Weapon

  def initialize window, gun
    begin
      @window, @gun = window, gun
      @img = Gosu::Image.new window, "images/weapons/" + gun + ".png", true
      @x, @y, @angle = 57.5, 225, 0
      @sound = Gosu::Song.new window, 'sounds/'+ gun +'.ogg'
      @power = 1.0
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window, :x, :y, :gun

  #draw
  def draw
    @img.draw_rot x, y, 2, angle
  end

  #draw ui
  def draw_ui
    @img.draw 25, 25, 3
  end

  #calculate angle
  def angle
    @angle = Gosu::angle(window.mouse_x, window.mouse_y, x, y) + 90
  end

  #calculate power
  def power
    case gun
    when "pistol"
      1.0
    when "ics_29"
      2.0
    when "ak"
      5.0
    end
  end

  #shot
  def shot
    @sound.play(looping = false)
  end

end