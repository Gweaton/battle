require 'player'

describe Player do
  let(:name) { double :name }
  subject(:player) { described_class.new(name) }

  it "should know the player's name" do
    expect(player.name).to eq name
  end
  it "should have HP" do
    expect(player.hp).to eq Player::DEFAULT_HP
  end

  it "should lose HP when attacked" do
    player.lose_hp(10)
    expect(player.hp).to eq(Player::DEFAULT_HP - 10)
  end

  it "should initialize with an inactive status" do
    expect(player.active).to be false
  end

  it "can die" do
      player.lose_hp(Player::DEFAULT_HP)
      expect(player.dead?).to be true
  end

  describe "#switch_status" do
    it "should switch a player's status from active to inactive" do
      player.active = true
      player.switch_status
      expect(player.active).to eq false
    end
    it "should set a player's status from inactive to active" do
      player.switch_status
      expect(player.active).to eq true
    end
  end
  describe "#check_status" do
    it "should show the player's status" do
      player.active = true
      expect(player.check_status).to eq true
    end
  end
end
