require 'game'

describe Game do
  let(:player1) { double :player1, :active => true }
  let(:player2) { double :player2, :active => false }
  subject(:game) { described_class.new(player1, player2) }
  before do
    allow(player1).to receive(:switch_status)
    allow(player2).to receive(:switch_status)
  end

  it "should perform attacks on the other player" do
    allow(player2).to receive(:lose_hp)
  end
  describe "player1_active?" do
    it "should check if player 1 is active" do
      expect(game.player1_active?).to eq true
    end
  end
  describe "player2_active?" do
    it "should check if player 2 is active" do
      expect(game.player2_active?).to eq false
    end
  end
  describe "switch_active_player" do
    it "should change an inactive player's status to true" do
      expect(player1).to receive(:switch_status)
      game.switch_active_player
    end
  end
  describe "active_player" do
    it "should return the active player" do
      expect(game.active_player).to eq game.player1
    end
  end
  describe "inactive player" do
    it "should return the inactive player" do
      expect(game.inactive_player).to eq game.player2
    end
  end
end
