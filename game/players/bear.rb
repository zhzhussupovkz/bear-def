=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Bear
class Bear

  def initialize window
    begin
      @window = window
      @img = Gosu::Image.new(window, "images/bear.png", false)
      @ui = Gosu::Font.new(window, 'Monaco', 20)
      @drawing, @stamina, @score = true, 100, 0
      @weapon = Weapon.new window
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window

  #draw
  def draw
    if @drawing
      @img.draw 30, 209, 1
      @weapon.draw
    end
    @ui.draw("Score: #{@score}", 25, 10, 3)
  end

  #shooting
  def shooting
    @weapon.shot if window.button_down? Gosu::MsLeft
  end

  #add score
  def add_score
    @score += 100
  end

  #update
  def update
    shooting
  end

end