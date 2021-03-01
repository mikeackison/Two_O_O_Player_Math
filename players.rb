class Players
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def wrong
    @lives -= 1
  end

  def is_alive?
    @lives >= 1
  end
end
