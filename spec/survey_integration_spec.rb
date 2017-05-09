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
end
