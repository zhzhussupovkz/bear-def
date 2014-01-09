=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Level
class Level

  def initialize window
    begin
      @window = window
      @bear = Bear.new window
      @home = Home.new window
      @bees = []
      @ui = Gosu::Font.new(window, 'Monaco', 20)
      generate_bees
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window, :bear

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
      if (Gosu::distance(window.mouse_x, window.mouse_y, e.x + 7.5, e.y + 5.0) <= 10) && (window.button_down? Gosu::MsLeft) && e.drawing
        e.add_injury
      end
    end
  end

  #draw
  def draw
    begin
      @bear.draw
      @home.draw
      @bees.each do |e| e.draw end
      time = (Time.at(Time.now.to_i)).strftime("%Y")
      @ui.draw("Copyright (c) #{time} by zhzhussupovkz", 225, 450, 3)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #update
  def update
    begin
      @bear.update
      @bees.each do |e| e.update end
      kill_bees
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

end
