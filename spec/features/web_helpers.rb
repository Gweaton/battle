def sign_in_and_play
  visit '/'
  fill_in "player1_name", :with => "George"
  fill_in "player2_name", :with => "Russell"
  click_button "Save"
end

def attack
  click_button "Attack"
end

def round_one_complete
  click_button("Attack Russell")
  click_button("Ok, back to battle!")
end
