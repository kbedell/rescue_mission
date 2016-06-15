require 'rails_helper'

feature "user posts a question" do

  scenario "user posts a question" do
    visit '/questions'
    click_link "Create Question"
    fill_in "Question Name", with: "This title should be 40 characters long."
    fill_in "Summary", with: "This body should be 150 characters long. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus turpis tempor, volutpat orci ac, ornare urna. 
"
    fill_in "Asker Name", with: "John Doe"
    click_button "Submit Question"

    expect(page).to have_content("This body should be 150 characters long. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus turpis tempor, volutpat orci ac, ornare urna.")
    expect(page).to have_content("This title should be 40 characters long.")
    expect(page).to have_content("John Doe")
  end

  scenario "user attempts to post invalid question " do
    visit '/questions'
    click_link "Create Question"
    click_button "Submit Question"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Name is too short (minimum is 40 characters)")
    expect(page).to have_content("Summary can't be blank")
    expect(page).to have_content("Summary is too short (minimum is 150 characters)")
    expect(page).to have_content("Asker can't be blank")
  end
end
