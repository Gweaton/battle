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
  describe "victory" do
    it "should end the game" do
      allow(player2).to receive(:dead?) { true }
      expect(game.victory).to eq true
    end
  end
end
