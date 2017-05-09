require "capybara/rspec"
require "./app"
require "pg"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the survey path", {:type => :feature}) do
  it("processes the user input and returns a capitalized topic for survey") do
    visit("/")
    fill_in("survey_topic", :with => "health care")
    click_button("Submit")
    expect(page).to have_content("Health Care")
  end


  it("processes the user input to add questions to the survey") do
    visit("/")
    fill_in("survey_topic", :with => "test survey topic")
    click_button("Submit")
    expect(page).to have_content("Test Survey Topic")
    click_link("Test Survey Topic")
    expect(page).to have_content("Add question")
    fill_in("question", :with => "How old are you?")
    click_button("Add question")
    expect(page).to have_content("Here are all your surveys")
  end

  it("allows a user to rename a survey") do
    visit("/")
    fill_in("survey_topic", :with => "test survey topic")
    click_button("Submit")
    expect(page).to have_content("Test Survey Topic")
    click_link("Test Survey Topic")
    expect(page).to have_content("Add question")
    fill_in("update_survey_topic", :with => "Renamed Survey Topic")
    click_button("Update")
    expect(page).to have_content("Renamed Survey Topic")
  end

  it("allows a user to delete a survey") do
    visit("/")
    fill_in("survey_topic", :with => "test survey topic")
    click_button("Submit")
    expect(page).to have_content("Test Survey Topic")
    click_link("Test Survey Topic")
    expect(page).to have_content("Add question")
    click_button("Delete Survey")
    expect(page).to have_content("Here are all your surveys")
  end
end
