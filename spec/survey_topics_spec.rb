require 'spec_helper'

describe(SurveyTopic) do
  it("has many questions") do
    survey_topic = SurveyTopic.create({:topic => "Healthcare"})
    question1 = Question.create({:question => "How old are you?", :survey_topic_id => survey_topic.id})
    question2 = Question.create({:question => "Do you have allergies?", :survey_topic_id => survey_topic.id})
    expect(survey_topic.questions).to(eq([question1, question2]))
  end

  describe('#topic') do
    it("will return the topic of the survey") do
      survey_topic = SurveyTopic.create({:topic => "Healthcare"})
      expect(survey_topic.topic).to(eq("Healthcare"))
    end
  end
end
