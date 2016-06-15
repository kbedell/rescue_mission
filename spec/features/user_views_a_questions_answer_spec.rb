require 'rails_helper'

feature "users answers a question" do
  let!(:question) {
    Question.create(
    asker: "Kat",
    name: "This title should be 40 characters long.",
    summary: "This body should be 150 characters long. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus turpis tempor, volutpat orci ac, ornare urna. 
")
  }

  let!(:answer) {
    Answer.create(
      answer: "This should be over 50 characters long because it has to be.",
      answer_giver: "Bobby Tables",
      question_id: question.id
    )
  }

  scenario "user views a question's answer" do
    visit '/questions'
    click_link question.name

    expect(page).to have_content("This should be over 50 characters long because it has to be.")
    expect(page).to have_content("Bobby Tables")
  end
end
