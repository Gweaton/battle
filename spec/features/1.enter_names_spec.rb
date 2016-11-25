require './app'

RSpec.feature "Beginning a fight", :type => :feature do
  scenario "Users enter their names" do
    sign_in_and_play
    expect(page).to have_text("George vs. Russell! Fight!!!")
  end

end
