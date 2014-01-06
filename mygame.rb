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
    @bg = Gosu::Image.new(self, "images/background.png", true)
    @cursor = Gosu::Image.new(self, 'images/target.png')
    @bees = []
    generate_bees
  end

  #generate bees
  def generate_bees
    (20..675).step(50) do |i|
      y_cord = rand(50..400)
      @bees << Bee.new(self, i, y_cord)
    end
  end

  #draw
  def draw
    @bg.draw(0, 0, 0)
    @bees.each do |e| e.draw end
    @cursor.draw(self.mouse_x, self.mouse_y, 3)
  end

  #update
  def update
    @bees.each do |e| e.update end
  end

  #button down event
  def button_down(key)
    case key
    when Gosu::KbEscape
      close
    end
  end

end