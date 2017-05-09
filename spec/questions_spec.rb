require("spec_helper")

describe(Question) do

  describe("#survey_topic") do
    it("tells which survey topic the question belongs to") do
      test_survey_topic = SurveyTopic.create({:topic => "Healthcare"})
      test_question = Question.create({:question => "How old are you?", :survey_topic_id => test_survey_topic.id})
      expect(test_question.survey_topic).to(eq(test_survey_topic))
    end
  end

  describe('question') do
    it("will return the question") do
      question = Question.create({:question => "How old are you?"})
      expect(question.question).to(eq("How old are you?"))
    end
  end
end


  # it("validates presence of description") do
  #   task = Task.new({:description => ""})
  #   expect(task.save()).to(eq(false))
  # end
  #
  #
  # it("ensures the length of description is at most 50 characters") do
  #   task = Task.new({:description => "a".*(51)})
  #   expect(task.save()).to(eq(false))
  # end
