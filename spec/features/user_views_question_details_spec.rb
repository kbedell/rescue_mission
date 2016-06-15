require 'rails_helper'

feature "users answers a question" do
  let!(:question) {
    Question.create(
    asker: "Kat",
    name: "This title should be 40 characters long.",
    summary: "This body should be 150 characters long. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus turpis tempor, volutpat orci ac, ornare urna. 
")
  }

  scenario "user views all questions" do
    question
    visit '/questions'
    click_link question.name
    expect(page).to have_content("This title should be 40 characters long.")
    expect(page).to have_content("This body should be 150 characters long. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus turpis tempor, volutpat orci ac, ornare urna. 
")
    expect(page).to have_content("Kat")
  end
end
