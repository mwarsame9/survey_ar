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


    it("validates presence of question") do
      question = Question.new({:question => ""})
      expect(question.save()).to(eq(false))
    end

    it("ensures the length of question is at least 10 characters") do
      question = Question.new({:question => "a".*(9)})
      expect(question.save()).to(eq(false))
    end

    it("ensures the length of question is at most 150 characters") do
      question = Question.new({:question => "a".*(151)})
      expect(question.save()).to(eq(false))
    end


end
