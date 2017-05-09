ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("questions")
require("survey_topics")

RSpec.configure do |config|
  config.after(:each) do
    Question.all().each() do |question|
      question.destroy()
    end
    SurveyTopic.all().each do |survey_topic|
      survey_topic.destroy()
    end
  end
end
