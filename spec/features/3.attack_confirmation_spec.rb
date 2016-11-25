require './app'

RSpec.feature "Attacking player 2", :type => :feature do
  scenario "Confirm attack" do
    sign_in_and_play
    attack
    expect(page).to have_content("You have administered a slap round the chops to Russell!")
    click_button("Ok, back to battle!")
    expect(page).to have_content("HP")
  end
end
