=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#MyGame
class Mygame < Gosu::Window

  include Singleton

  def initialize
    super 720, 480, false
    self.caption = "Bear Defender"
    @bg = Gosu::Image.new self, "images/background.png", true
    @cursor = Gosu::Image.new self, 'images/target.png'
    @level = Level.new self
  end

  attr_reader :level

  #draw
  def draw
    @bg.draw(0, 0, 0)
    @level.draw
    @cursor.draw(self.mouse_x, self.mouse_y, 3)
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