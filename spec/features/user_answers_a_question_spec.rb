require 'rails_helper'

feature "user answers a question" do
  let!(:question) {
    Question.create(
    asker: "Kat",
    name: "This title should be 40 characters long.",
    summary: "This body should be 150 characters long. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus turpis tempor, volutpat orci ac, ornare urna. 
")
  }

  scenario "user adds answer to question" do
    visit '/questions'
    click_link question.name
    fill_in "Answer", with: "Ut augue nulla, porta in odio at, consequat auctor magna. Sed erat urna, pretium id pharetra sit amet, fringilla non nunc."
    fill_in "Answer Giver", with: "John Doe"
    click_button "Submit Answer"
    expect(page).to have_content("John Doe")
    expect(page).to have_content("Ut augue nulla, porta in odio at, consequat auctor magna. Sed erat urna, pretium id pharetra sit amet, fringilla non nunc.")
  end

  scenario "user tries to submit an answer less than 50 characters" do
    visit '/questions'
    click_link question.name
    fill_in "Answer", with: "Not 50 characters"
    fill_in "Answer Giver", with: "John Doe"
    click_button "Submit Answer"
    expect(page).to have_content("Answer is too short (minimum is 50 characters)")
    expect(find_field("Answer").value).to eq("Not 50 characters")
    expect(find_field("Answer Giver").value).to eq("John Doe")
  end

  scenario "user tries to submit an answer with no answer giver" do
    visit '/questions'
    click_link question.name
    fill_in "Answer", with: "Ut augue nulla, porta in odio at, consequat auctor magna. Sed erat urna, pretium id pharetra sit amet, fringilla non nunc."
    click_button "Submit Answer"
    expect(page).to have_content("Answer giver can't be blank")
    expect(find_field("Answer").value).to eq("Ut augue nulla, porta in odio at, consequat auctor magna. Sed erat urna, pretium id pharetra sit amet, fringilla non nunc.")
  end
end
