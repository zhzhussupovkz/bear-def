=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Home
class Home

  def initialize window
    begin
      @window = window
      @img = Gosu::Image.new window, "images/prop.png", true
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window

  #draw
  def draw
    @img.draw 0, 240, 1
  end
  
end