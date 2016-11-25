require './app'

RSpec.feature "Player 1 wins", :type => :feature do
  scenario "When player 2's hp reaches 0, give player 1 a victory message" do
    sign_in_and_play
    3.times do
      both_turns_complete
    end
    round_one_complete
    expect(page).to have_text("Russell slumps to the ground, and has to have a little rest. George wins!")
  end

end
