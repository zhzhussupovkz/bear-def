=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#MyGame
class Mygame < Gosu::Window

  include Singleton

  def initialize
    super 720, 480, false
    self.caption = "Bear Defender"
    begin
      @bg = Gosu::Image.new self, "images/background.png", true
      @cursor = Gosu::Image.new self, 'images/target.png'
      @level = Level.new self
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :level

  #draw
  def draw
    begin
      @bg.draw(0, 0, 0)
      @level.draw
      @cursor.draw(self.mouse_x, self.mouse_y, 3)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #update
  def update
    @level.update
  end

  #button down event
  def button_down(key)
    case key
    when Gosu::KbEscape
      close
    end
  end

end