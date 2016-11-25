class Player
  DEFAULT_HP = 40
  attr_reader :name, :hp, :active
  attr_writer :active

  def initialize(name, active = false)
    @name = name
    @hp = DEFAULT_HP
    @active = active
  end

  def lose_hp(number)
    self.hp -= number
  end

  def switch_status
    self.active = !self.active
  end

  def check_status
    self.active
  end
  
  def dead?
    self.hp <= 0
  end

  private
  attr_writer :hp

end
