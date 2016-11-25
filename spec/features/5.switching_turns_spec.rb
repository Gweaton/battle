require './app'

RSpec.feature "Switching turns", :type => :feature do
  before do
    sign_in_and_play
  end
  scenario "player1's turn" do
    expect(page).to have_text("George's turn:")
  end
  scenario "player1 attacks player2" do
    click_button("Attack Russell")
    expect(page).to have_text("You have administered a slap round the chops to Russell!")
  end
  scenario "player2's turn" do
    round_one_complete
    expect(page).to have_text("Russell's turn:")
  end
  scenario "player2 attacks player 1" do
    round_one_complete
    click_button("Attack George")
    expect(page).to have_text("You have administered a slap round the chops to George!")
  end


end
