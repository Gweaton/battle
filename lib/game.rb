require_relative 'player'

class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    self.player2.switch_status
  end

  def attack(attacked, number = 10)
    attacked.lose_hp(number)
  end

  def victory
    return active_player if inactive_player.dead?
  end

  def active_player
    return self.player1 if player1_active?
    return self.player2 if player2_active?
  end

  def inactive_player
    return self.player1 if !player1_active?
    return self.player2 if !player2_active?
  end

  def switch_active_player
    self.player1.switch_status
    self.player2.switch_status
  end

  private
  def player1_active?
    self.player1.active
  end

  def player2_active?
    self.player2.active
  end
end
