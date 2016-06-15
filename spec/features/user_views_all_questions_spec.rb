require 'rails_helper'

feature "user views all questions" do
  let!(:question) {
    Question.create(
    asker: "Kat",
    name: "This title should be 40 characters long.",
    summary: "This body should be 150 characters long. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus turpis tempor, volutpat orci ac, ornare urna. 
")
  }

  let!(:question2) {
    Question.create(
    asker: "Kat",
    name: "Ah, this title should also be 40 characters long.",
    summary: "This body should be 150 characters long. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus turpis tempor, volutpat orci ac, ornare urna. 
")
  }

  scenario "user views all questions" do
    visit '/questions'
    expect(page).to have_content("This title should be 40 characters long.")
    expect(page).to have_content("Ah, this title should also be 40 characters long.")
    expect("Ah, this title should also be 40 characters long.").to appear_before("This title should be 40 characters long.")
  end
end
