=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Level
class Level

  def initialize window
    @window = window
    @bear = Bear.new window
    @home = Home.new window
    @bees = []
    generate_bees
  end

  attr_reader :window

  #generate bees
  def generate_bees
    (20..675).step(50) do |i|
      y_cord = rand(50..400)
      @bees << Bee.new(window, i, y_cord)
    end
  end

  #kill bees
  def kill_bees
    @bees.each do |e|
      if (Gosu::distance(window.mouse_x, window.mouse_y, e.x, e.y) <= 10) && (window.button_down? Gosu::MsLeft) && e.drawing
        e.add_injury
      end
    end
  end

  #draw
  def draw
    @bear.draw
    @home.draw
    @bees.each do |e| e.draw end
  end

  #update
  def update
    @bear.update
    @bees.each do |e| e.update end
    kill_bees
  end

end