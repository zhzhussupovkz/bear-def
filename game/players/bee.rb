=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Bee
class Bee

  def initialize window, x, y
    begin
      @window, @x, @y = window, x, y
      @img = Gosu::Image.new(window, "images/bee.png", false)
      @drawing, @green, @red = true, Gosu::Color.argb(0xff00ff00), Gosu::Color.argb(0xffff0000)
      @stamina = 100
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_accessor :x, :y
  attr_reader :window, :green, :red, :stamina, :drawing
  
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
    if stamina == 0
      @drawing = false
      window.level.bear.add_score
      @stamina = 100
    end
  end

  #move left
  def move_left
    @x -= 1.0
    reboot if @x <= 0
  end

  #move right
  def move_right
    @x += 1.0
  end

  #reboot
  def reboot
    begin
      @x = 720
      @drawing = true
      @stamina = 100
      @y = rand(50..400)
      @img = Gosu::Image.new(window, "images/bee.png", false)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #add injury when player attack
  def add_injury
    @stamina -= window.level.bear.weapon_power
    @stamina = 0 if @stamina <= 0
  end

end