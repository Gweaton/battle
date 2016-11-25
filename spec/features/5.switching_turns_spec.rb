require './app'

RSpec.feature "Switching turns", :type => :feature do
  before do
    sign_in_and_play
  end
  scenario "player1's turn" do
    expect(page).to have_text("George's turn:")
  end
  scenario "player1's attack" do
    click_button("Attack Russell")
    expect(page).to have_text("You have administered a slap round the chops to Russell!")
  end
  scenario "player2's turn" do
    click_button("Attack Russell")
    click_button("Ok, back to battle!")
    expect(page).to have_text("Russell's turn:")
  end
end
