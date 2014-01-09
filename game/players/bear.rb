=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Bear
class Bear

  def initialize window
    begin
      @window = window
      @gun = "pistol"
      @img = Gosu::Image.new(window, "images/bear.png", false)
      @ui = Gosu::Font.new(window, 'Monaco', 20)
      @drawing, @stamina, @score, @lives = true, 100, 0, 3
      @weapon = Weapon.new window, gun
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window, :gun

  #draw
  def draw
    if @drawing
      @img.draw 30, 209, 1
      @weapon.draw
    end
    @ui.draw("Score: #{@score}", 25, 10, 3)
    @weapon.draw_ui
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

  #add injury
  def add_injury
    @stamina -= 2.0
  end

  #change weapon
  def change_weapon gun
    @weapon = Weapon.new window, gun
  end

  #get weapon power
  def weapon_power
    @weapon.power
  end

end